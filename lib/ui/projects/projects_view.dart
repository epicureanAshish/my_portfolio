
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/ui/projects/projects_desktop_view.dart';
import 'package:my_portfolio/ui/projects/projects_tablet_view.dart';
import 'package:my_portfolio/ui/projects/projects_mobile_view.dart';

class ProjectsView extends StatelessWidget {
  final List projects;
  const ProjectsView(this.projects, {super.key});

  @override
  Widget build(BuildContext context) {
    switch(getCustomScreenType(context)){
      case CustomScreenType.desktop: return ProjectsDesktopView(projects);
      case CustomScreenType.tablet: return ProjectsTabletView(projects);
      case CustomScreenType.mobile: return ProjectsMobileView(projects);
    }
  }
}