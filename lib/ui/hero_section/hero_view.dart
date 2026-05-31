
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/ui/hero_section/hero_desktop_view.dart';
import 'package:my_portfolio/ui/hero_section/hero_tablet_view.dart';
import 'package:my_portfolio/ui/hero_section/hero_mobile_view.dart';

class HeroView extends StatelessWidget {
  final Map bio;
  final void Function() onViewMyWorkTap;
  const HeroView(this.bio, {super.key, required this.onViewMyWorkTap});


  @override
  Widget build(BuildContext context) {
    switch(getCustomScreenType(context)){
      case CustomScreenType.desktop: return HeroDesktopView(bio, onViewMyWorkTap: onViewMyWorkTap);
      case CustomScreenType.tablet: return HeroTabletView(bio, onViewMyWorkTap: onViewMyWorkTap);
      case CustomScreenType.mobile: return HeroMobileView(bio, onViewMyWorkTap: onViewMyWorkTap);
    }
  }
}