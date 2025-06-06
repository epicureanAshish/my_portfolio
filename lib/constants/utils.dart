
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum CustomScreenType { mobile, tablet, desktop }

CustomScreenType getCustomScreenType(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width >= 1100) {
    return CustomScreenType.desktop;
  } else if (width >= 720 && width<1100) {
    return CustomScreenType.tablet;
  } else {
    return CustomScreenType.mobile;
  }
}

Future<void> launchUrlMethod(String url) async {
  if (!await launchUrlString(url)) {
    throw Exception('Could not launch $url');
  }
}
