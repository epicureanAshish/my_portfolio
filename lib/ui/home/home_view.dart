
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/ui/home/mobile_ui/home_mobile_view.dart';
import 'package:my_portfolio/ui/home/tablet_ui/home_tablet_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    switch(getCustomScreenType(context)){
      case CustomScreenType.desktop: return HomeTabletView();
      case CustomScreenType.tablet: return HomeTabletView();
      case CustomScreenType.mobile: return HomeMobileView();
      }
  }
}
