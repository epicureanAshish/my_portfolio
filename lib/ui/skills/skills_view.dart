
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/ui/skills/skills_desktop_view.dart';
import 'package:my_portfolio/ui/skills/skills_tablet_view.dart';
import 'package:my_portfolio/ui/skills/skills_mobile_view.dart';

class SkillsView extends StatelessWidget {
  final List skills;
  const SkillsView(this.skills, {super.key});


  @override
  Widget build(BuildContext context) {
    switch(getCustomScreenType(context)){
      case CustomScreenType.desktop: return SkillsDesktopView(skills);
      case CustomScreenType.tablet: return SkillsTabletView(skills);
      case CustomScreenType.mobile: return SkillsMobileView(skills);
    }
  }
}