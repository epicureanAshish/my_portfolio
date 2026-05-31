
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/ui/home/home_mobile_view.dart';
import 'package:my_portfolio/ui/home/home_tablet_view.dart';
import 'package:my_portfolio/ui/home/home_desktop_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("HomeView build called screen Width: ${MediaQuery.of(context).size.width} screen type: ${getCustomScreenType(context)}");
    switch(getCustomScreenType(context)){
      case CustomScreenType.desktop: return HomeDesktopView();
      case CustomScreenType.tablet: return HomeTabletView();
      case CustomScreenType.mobile: return HomeMobileView();
    }
  }
}