
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/injection_container.dart';
import 'package:my_portfolio/widgets/fade_slide_section.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header_text.dart';
import 'package:my_portfolio/widgets/responsive_section.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _featuredProjects(context);
  }

  Widget _descriptionText(context,String title)=>Container(
    padding: EdgeInsets.only(bottom: 5),
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Text(title, style: TextStyle(
        fontSize: getCustomScreenType(context)==CustomScreenType.mobile?30.sp:20.sp,
        color: Colors.white),),
  );


  Widget _featuredProjects(context) =>
      SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            HeaderText(title: "Things I've Built"),
            SizedBox(height: 20,),
            _descriptionText(context,"A Collection of apps, interfaces and solutions i've brought to life."),
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
                      return GridView.builder(
                        shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                            getCustomScreenType(context) == CustomScreenType.desktop ? 3 :
                            getCustomScreenType(context) == CustomScreenType.tablet ? 2 :3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent:
                            getCustomScreenType(context) == CustomScreenType.desktop ? 280.h :
                            getCustomScreenType(context) == CustomScreenType.tablet ? 280.h :100.h,
                          ),
                          itemCount: projectsList.length,
                          itemBuilder:  (context,index) =>
                              SizedBox(
                                height: 100,
                                // getCustomScreenType(context) == CustomScreenType.desktop ? 280.h :200.h,
                                width: getCustomScreenType(context) == CustomScreenType.desktop ? 1.sw/3 :1.sw/1.5,
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
                                              height:
                                              getCustomScreenType(context) == CustomScreenType.mobile ? 1.sw :
                                              getCustomScreenType(context) == CustomScreenType.tablet ? 1.5.sw :
                                              2.sw,
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
                              )
                      );
                    }
                )
            ),
            SizedBox(height: 60,),
            Divider(color: Colors.white54,),
            SizedBox(height: 20,),
            const FooterWidget(),
            SizedBox(height: 20,),
          ],
        ),
      );
  
}