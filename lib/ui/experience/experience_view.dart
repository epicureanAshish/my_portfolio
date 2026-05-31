
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/ui/experience/experience_desktop_view.dart';
import 'package:my_portfolio/ui/experience/experience_tablet_view.dart';
import 'package:my_portfolio/ui/experience/experience_mobile_view.dart';

class ExperienceView extends StatelessWidget {
  final List experience;
  const ExperienceView(this.experience, {super.key});

  @override
  Widget build(BuildContext context) {
    switch(getCustomScreenType(context)){
      case CustomScreenType.desktop: return ExperienceDesktopView(experience);
      case CustomScreenType.tablet: return ExperienceTabletView(experience);
      case CustomScreenType.mobile: return ExperienceMobileView(experience);
    }
  }
}