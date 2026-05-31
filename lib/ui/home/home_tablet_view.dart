import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/injection_container.dart';
import 'package:my_portfolio/ui/about_me/about_me_view.dart';
import 'package:my_portfolio/ui/experience/experience_view.dart';
import 'package:my_portfolio/ui/hero_section/hero_view.dart';
import 'package:my_portfolio/ui/nav_bar/nav_bar.dart';
import 'package:my_portfolio/ui/projects/projects_view.dart';
import 'package:my_portfolio/ui/skills/skills_view.dart';

class HomeTabletView extends StatefulWidget {
  const HomeTabletView({super.key});

  @override
  State<HomeTabletView> createState() => _HomeTabletViewState();
}

class _HomeTabletViewState extends State<HomeTabletView> {
  final ScrollController _scrollController = ScrollController();

  final navKey = GlobalKey();
  final heroKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final experienceKey = GlobalKey();

  final ValueNotifier<bool> showFab = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 300) {
        showFab.value = true;
      } else {
        showFab.value = false;
      }
    });
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050816),
      body: StreamBuilder(
        stream: getIt<FirebaseFirestore>()
            .collection("portfolio_data")
            .doc("home_screen_data")
            .snapshots(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!asyncSnapshot.hasData || asyncSnapshot.data == null) {
            return SizedBox.shrink();
          }
          Map headerData = asyncSnapshot.data?.data()?["header"] ?? {};
          Map bio = asyncSnapshot.data?.data()?["bio"] ?? {};
          String aboutMe = asyncSnapshot.data?.data()?["about_me"] ?? '';
          List skills = asyncSnapshot.data?.data()?["skills"] ?? [];
          List projects = asyncSnapshot.data?.data()?["projects"] ?? [];
          List experience = asyncSnapshot.data?.data()?["experience"] ?? [];
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  key: navKey,
                  child: Navbar(
                    headerData,
                    onHomeTap: () => scrollToSection(heroKey),
                    onSkillsTap: () => scrollToSection(skillsKey),
                    onProjectsTap: () => scrollToSection(projectsKey),
                    onExperienceTap: () => scrollToSection(experienceKey),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, ),
                  key: heroKey,
                  child: HeroView(
                    bio,
                    onViewMyWorkTap: () => scrollToSection(projectsKey),
                  ),
                ),

                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                     child: AboutMeView(aboutMeData: aboutMe, onExploreMoreTap: () => scrollToSection(experienceKey))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    key: skillsKey, child: SkillsView(skills)),

                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    key: projectsKey, child: ProjectsView(projects)),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  key: experienceKey,
                  child: ExperienceView(experience),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: showFab,
        builder: (context, visible, child) {
          return AnimatedSlide(
            duration: const Duration(milliseconds: 250),
            offset: visible
                ? Offset.zero
                : const Offset(0, 2),

            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: visible ? 1 : 0,

              child: FloatingActionButton(
                backgroundColor: AppColors.purpleColor1,
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
