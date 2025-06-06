import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/injection_container.dart';
import 'package:my_portfolio/ui/about_section.dart';
import 'package:my_portfolio/ui/contact/tablet_ui/contact_tablet_view.dart';
import 'package:my_portfolio/ui/hero_section.dart';
import 'package:my_portfolio/ui/projects_section.dart';
import 'package:my_portfolio/ui/skills_section.dart' show SkillsSection;

class HomeTabletView extends StatefulWidget {
  const HomeTabletView({super.key});

  @override
  State<HomeTabletView> createState() => _HomeTabletViewState();
}

class _HomeTabletViewState extends State<HomeTabletView>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("WIDTH ${MediaQuery
        .of(context)
        .size
        .width} ${getCustomScreenType(context)}");
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(onPressed: () {
        getIt<FirebaseFirestore>().collection("portfolio_data").doc(
            "home_screen_data")
            .set({
          'tech_stack': [
                "https://docs.flutter.dev/assets/images/flutter-logo-sharing.png",
                "https://cdn.prod.website-files.com/635637c5d13ee9bd2b5feb65/635a651e4bede08ec30eab10_6357cf607fa414586ac82d57_gc.png",
                "https://www.gstatic.com/devrel-devsite/prod/vce7dc8716edeb3714adfe4dd15b25490031be374149e3613a8b7fb0be9fc4a25/firebase/images/touchicon-180.png",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Figma-logo.svg/250px-Figma-logo.svg.png",
                "https://i.pinimg.com/736x/42/67/ef/4267ef107fa8be5a0c31803cdc34c2d3.jpg",
                "https://cdn.prod.website-files.com/657639ebfb91510f45654149/67f6a20bd169ab569ec254c0_gitlab-icon-1024x942-f30d1qro.png",
                "https://upload.wikimedia.org/wikipedia/commons/c/c2/Postman_%28software%29.png",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Android_Studio_icon_%282023%29.svg/1200px-Android_Studio_icon_%282023%29.svg.png",

          ]
        }, SetOptions(merge: true));
      }),
      appBar: PreferredSize(
          preferredSize: Size(
              MediaQuery
                  .of(context)
                  .size
                  .width
              , 100), child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ashish Chauhan", style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30.sp,
                color: Colors.white),),
            SizedBox(width: 100,),
            TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                controller: tabController,
                labelStyle: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                    color: Colors.white),
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(text: "Home",),
                  Tab(text: "Portfolio",),
                  Tab(text: "Blogs",),
                  Tab(text: "About",),
                  Tab(text: "Contact",),
                ])
          ],
        ),
      )
      ),
      body: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            _homeView(),
            ProjectsSection(),
            // HeroSection(),
            AboutSection(),
            SkillsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }

  Widget _homeView() =>
      ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: RichText(text: TextSpan(
                      text: "I am Ashish Chauhan - A ",
                      style: TextStyle(
                          fontSize: 60.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                      children: [
                        TextSpan(text: "Flutter craftsman ",
                            style: TextStyle(color: Colors.green)),
                        TextSpan(
                            text: "blending clean architecture, sleek UI, and blazing performance to build beautiful, scalable apps that turn ideas into reality."),
                      ]
                  )),
                ),
                SizedBox(width: 100,),
                Image.asset("assets/images/my_image.png",
                  height: MediaQuery
                      .of(context)
                      .size
                      .width * 0.3,
                ),
              ],
            ),
          ),
          SizedBox(height: 60,),
          _whatIDo(),
          SizedBox(height: 60,),
          _featuredProjects(),
          SizedBox(height: 60,),
          _techStack(),
          SizedBox(height: 60,),
          Divider(color: Colors.white54,),
          SizedBox(height: 20,),
          _footer(),
          SizedBox(height: 20,),

        ],
      );

  Widget _whatIDo() =>
      Column(
        children: [
        _headingText("💼 What I Do"),
          SizedBox(height: 20,),
          StreamBuilder(
              stream: getIt<FirebaseFirestore>()
                  .collection("portfolio_data")
                  .doc("home_screen_data")
                  .snapshots(),
              builder: (context, asyncSnapshot) {
                if (!asyncSnapshot.hasData || asyncSnapshot.data == null) {
                  return SizedBox.shrink();
                }
                List whatIdoData = asyncSnapshot.data?.data()?["what_i_do"];
                return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: List.generate(
                        whatIdoData.length,
                            (index) =>
                            Card(
                              borderOnForeground: true,
                              shadowColor: Colors.white,
                              color: Colors.black38,
                              child: Container(
                                width: (getCustomScreenType(context) ==
                                    CustomScreenType.desktop ? 1.sw / 3 :
                                getCustomScreenType(context) ==
                                    CustomScreenType.tablet ? 1.sw / 2 :
                                1.sw) - 40,
                                padding: EdgeInsets
                                    .all(getCustomScreenType(context)==CustomScreenType.mobile?40:20.0)
                                    .r,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: getCustomScreenType(context)==CustomScreenType.mobile?80.h:60.h,
                                        child: Image.network(
                                          whatIdoData[index]["icon"],)),
                                    SizedBox(height: 20.h,),
                                    Text(whatIdoData[index]["title"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight
                                          .bold,
                                          fontSize: getCustomScreenType(context)==CustomScreenType.tablet?40.sp:30.sp, color: Colors
                                          .white),),
                                    SizedBox(height: 20.h,),
                                    Text(whatIdoData[index]["description"],
                                      textAlign: TextAlign.center,
                                      maxLines: 10,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: getCustomScreenType(context)==CustomScreenType.tablet?30.sp:20.sp,
                                          color: Colors.white),),
                                  ],
                                ),
                              ),
                            )
                    ));
              }
          )
        ],
      );

  Widget _featuredProjects() =>
      Column(
        children: [
          _headingText("Featured Projects"),
          SizedBox(height: 20,),
          SizedBox(
              // height: 200,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: StreamBuilder(
                  stream: getIt<FirebaseFirestore>().collection(
                      "portfolio_data")
                      .doc("portfolio_screen_data")
                      .snapshots(),
                  builder: (context, asyncSnapshot) {
                    if (!asyncSnapshot.hasData || asyncSnapshot.data == null) {
                      return SizedBox.shrink();
                    }
                    List projectsList = asyncSnapshot.data
                        ?.data()?["projects"] ?? [];
                    return Row(
                        children: List.generate(projectsList.length, (index) =>
                            SizedBox(
                              height: getCustomScreenType(context) == CustomScreenType.desktop ? 280.h :280.h,
                              width: getCustomScreenType(context) == CustomScreenType.desktop ? 1.sw/3 :1.sw/2,
                              child: Card(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                borderOnForeground: true,
                                shadowColor: Colors.white,
                                color: Colors.black38,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex:1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        ),
                                        child: Container(
                                            height: getCustomScreenType(context) == CustomScreenType.mobile ? 1.sw :2.sw,
                                            width: getCustomScreenType(context) == CustomScreenType.mobile ? 1.sw :2.sw,
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                            ),
                                            child: Image.network(
                                              projectsList[index]["icon"],fit: BoxFit.cover,)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Text(projectsList[index]["title"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: getCustomScreenType(context)==CustomScreenType.tablet?40.sp:30.sp,
                                                  color: Colors.white),),
                                            Flexible(
                                              child: Text(
                                                projectsList[index]["description"],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                                style: TextStyle(fontSize: getCustomScreenType(context)==CustomScreenType.tablet?30.sp:20.sp,
                                                    color: Colors.white),),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                    );
                  }
              )
          )
        ],
      );

  Widget _techStack() =>
      Column(
        children: [
          _headingText("Tech Stack"),
          SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 100,
            child: StreamBuilder(
                stream: getIt<FirebaseFirestore>()
                    .collection("portfolio_data")
                    .doc("home_screen_data")
                    .snapshots(),
                builder: (context, asyncSnapshot) {
                  if (!asyncSnapshot.hasData || asyncSnapshot.data == null) {
                    return SizedBox.shrink();
                  }
                  List techStackData = asyncSnapshot.data?.data()?["tech_stack"];
                return CarouselSlider(
                  items: List.generate(techStackData.length, (index)=>Image.network(
                    techStackData[index],
                      height: 100, fit: BoxFit.fitHeight,)),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 0.25,
                    aspectRatio: 1.5,
                    initialPage: 1,
                  ),
                );
              }
            ),
          ),

        ],
      );

  Widget _headingText(String title)=>Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.white,width: 3)
        )
    ),
    padding: EdgeInsets.only(bottom: 5),
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Text(title, style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getCustomScreenType(context)==CustomScreenType.mobile?110.sp:40.sp,
        color: Colors.white),),
  );

  Widget _footer() =>
      Column(
        children: [
          Text("🔗 Let's Connect",
            style: TextStyle(fontSize: 16, color: Colors.white),),
          SizedBox(height: 10,),
          RichText(text: TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.white),
              children: [
                TextSpan(text: "LinkedIn", recognizer: TapGestureRecognizer()..onTap = () { launchUrlMethod("https://www.linkedin.com/in/ashish-chauhan-6b9069141/");},),
                WidgetSpan(child: SizedBox(width: 20,)),
                TextSpan(text: "GitHub", recognizer: TapGestureRecognizer()..onTap = () { launchUrlMethod("https://github.com/epicureanAshish?tab=repositories");},),
                WidgetSpan(child: SizedBox(width: 20,)),
                TextSpan(text: "Email", recognizer: TapGestureRecognizer()..onTap = () { launchUrlMethod("mailto:ashishchauhan0206@gmail.com");},),
              ]
          )),

          SizedBox(height: 10,),
          Text(
            "Made with Flutter ❤️ | © 2025 Ashish Chauhan. All rights reserved.",
            style: TextStyle(fontSize: 16, color: Colors.white),),
        ],
      );
}
