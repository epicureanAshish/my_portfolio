import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/constants/utils.dart';


class AppTextStyles {
  AppTextStyles._();

  /// =========================================================
  /// HEADINGS
  /// =========================================================

  static TextStyle heading1(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 48.sp
          : screen == CustomScreenType.tablet
          ? 40.sp
          : 28.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: 1.2,
    );
  }

  static TextStyle heading2(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: screen==CustomScreenType.mobile?110.sp:40.sp,
        color: Colors.white);
  }

  static TextStyle sectionTitle(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 26.sp
          : screen == CustomScreenType.tablet
          ? 22.sp
          : 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 0.5,
    );
  }

  /// =========================================================
  /// BODY / DESCRIPTION
  /// =========================================================

  static TextStyle bodyLarge(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 18.sp
          : screen == CustomScreenType.tablet
          ? 16.sp
          : 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      height: 1.6,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 16.sp
          : screen == CustomScreenType.tablet
          ? 15.sp
          : 13.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
      height: 1.5,
    );
  }

  static TextStyle description(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 18.sp
          : screen == CustomScreenType.tablet
          ? 16.sp
          : 13.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
      height: 1.7,
    );
  }

  /// =========================================================
  /// BUTTONS
  /// =========================================================

  static TextStyle buttonText(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 16.sp
          : screen == CustomScreenType.tablet
          ? 15.sp
          : 13.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  /// =========================================================
  /// NAVBAR
  /// =========================================================

  static TextStyle navItem(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 18.sp
          : screen == CustomScreenType.tablet
          ? 16.sp
          : 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  static TextStyle navItemSelected(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 18.sp
          : screen == CustomScreenType.tablet
          ? 16.sp
          : 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.greenAccent,
    );
  }

  /// =========================================================
  /// TIMELINE
  /// =========================================================

  static TextStyle timelineYear(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 22.sp
          : screen == CustomScreenType.tablet
          ? 20.sp
          : 16.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle timelineContent(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 17.sp
          : screen == CustomScreenType.tablet
          ? 15.sp
          : 13.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      height: 1.6,
    );
  }

  /// =========================================================
  /// FOOTER
  /// =========================================================

  static TextStyle footerTitle(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 18.sp
          : screen == CustomScreenType.tablet
          ? 16.sp
          : 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle footerText(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 14.sp
          : screen == CustomScreenType.tablet
          ? 13.sp
          : 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white60,
    );
  }

  /// =========================================================
  /// CUSTOM STYLE
  /// =========================================================

  static TextStyle custom(
      BuildContext context, {
        double? desktop,
        double? tablet,
        double? mobile,
        FontWeight? fontWeight,
        Color? color,
        double? height,
        double? letterSpacing,
      }) {
    final screen = getCustomScreenType(context);

    double size = screen == CustomScreenType.desktop
        ? (desktop ?? 16)
        : screen == CustomScreenType.tablet
        ? (tablet ?? 14)
        : (mobile ?? 12);

    return TextStyle(
      fontSize: size.sp,
      fontWeight: fontWeight,
      color: color ?? Colors.white,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}