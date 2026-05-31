import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/utils.dart';


class AppTextStyles {
  AppTextStyles._();

  /// =========================================================
  /// HEADINGS
  /// =========================================================

  static TextStyle heading1(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: screen==CustomScreenType.mobile?110.sp:40.sp,
        color: Colors.white);
  }

  static TextStyle heading2(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: screen==CustomScreenType.mobile?90.sp:40.sp,
        color: Colors.white);
  }

  static TextStyle sectionTitle(BuildContext context) {
    final screen = getCustomScreenType(context);

    return TextStyle(
      fontSize: screen == CustomScreenType.desktop
          ? 26.sp
          : screen == CustomScreenType.tablet
          ? 22.sp
          : 80.sp,
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
          ? 20.sp
          : screen == CustomScreenType.tablet
          ? 25.sp
          : 70.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      // height: 1.6,
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
        double? fontSize,
        double? desktop,
        double? tablet,
        double? mobile,
        FontWeight? fontWeight,
        FontWeight? desktopFontWeight,
        FontWeight? tabletFontWeight,
        FontWeight? mobileFontWeight,
        Color? color,
        Color? desktopColor,
        Color? tabletColor,
        Color? mobileColor,
        double? height,
        double? letterSpacing,
      }) {
    final screen = getCustomScreenType(context);

    double size = fontSize ?? (screen == CustomScreenType.desktop
        ? (desktop ?? 16)
        : screen == CustomScreenType.tablet
        ? (tablet ?? 14)
        : (mobile ?? 12));
    FontWeight? fontWeight0 = fontWeight ?? (screen == CustomScreenType.desktop
        ? (desktopFontWeight ?? FontWeight.w400)
        : screen == CustomScreenType.tablet
        ? (tabletFontWeight ?? FontWeight.w400)
        : (mobileFontWeight ?? FontWeight.w400));

    Color? textColor = color ?? (screen == CustomScreenType.desktop
        ? (desktopColor ?? Colors.white)
        : screen == CustomScreenType.tablet
        ? (tabletColor ?? Colors.white)
        : (mobileColor ?? Colors.white));



    return TextStyle(
      fontSize: size.sp,
      fontWeight: fontWeight0,
      color: textColor,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle customStyle(
      CustomScreenType screenType, {
        double? fontSize,
        double? desktop,
        double? tablet,
        double? mobile,
        FontWeight? fontWeight,
        FontWeight? desktopFontWeight,
        FontWeight? tabletFontWeight,
        FontWeight? mobileFontWeight,
        Color? color,
        Color? desktopColor,
        Color? tabletColor,
        Color? mobileColor,
        double? height,
        double? letterSpacing,
      }) {


    double size = fontSize ?? (screenType == CustomScreenType.desktop
        ? (desktop ?? 16)
        : screenType == CustomScreenType.tablet
        ? (tablet ?? 14)
        : (mobile ?? 12));
    FontWeight? fontWeight0 = fontWeight ?? (screenType == CustomScreenType.desktop
        ? (desktopFontWeight ?? FontWeight.w400)
        : screenType == CustomScreenType.tablet
        ? (tabletFontWeight ?? FontWeight.w400)
        : (mobileFontWeight ?? FontWeight.w400));

    Color? textColor = color ?? (screenType == CustomScreenType.desktop
        ? (desktopColor ?? Colors.white)
        : screenType == CustomScreenType.tablet
        ? (tabletColor ?? Colors.white)
        : (mobileColor ?? Colors.white));



    return TextStyle(
      fontFamily: "Poppins",
      fontSize: size.sp,
      fontWeight: fontWeight0,
      color: textColor,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Navbar

  static TextStyle headerTabs(CustomScreenType screenType) {
    return customStyle(
        screenType,
        desktop: 16,
        tablet: 40,
        mobile: 80,
        desktopColor: Colors.white70,
        tabletColor: Colors.white70,
        mobileColor: Colors.white,
        desktopFontWeight: FontWeight.w500,
        tabletFontWeight: FontWeight.w500,
        mobileFontWeight: FontWeight.w600
    );
  }

  static TextStyle headerName(CustomScreenType screenType) {
    return customStyle(
        screenType,
        desktop: 22,
        tablet: 60,
        mobile: 100,
        color: Colors.white,
        fontWeight: FontWeight.w600,

    );
  }

  // Hero Section

  static TextStyle designationStyle(CustomScreenType screenType) {
    return customStyle(
      screenType,
      desktop: 30,
      tablet: 40,
      mobile: 80,
      color: AppColors.purpleColor3,
      letterSpacing: 2,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle profileTitleStyle(CustomScreenType screenType) {
    return customStyle(
      screenType,
      desktop: 68,
      tablet: 70,
      mobile: 120,
      color: Colors.white,
      height: 1.15,
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bioDescStyle(CustomScreenType screenType) {
    return customStyle(
      screenType,
      desktop: 18,
      tablet: 35,
      mobile: 70,
      color: Colors.white70,
      height: 1.8,
    );
  }

  static TextStyle buttonTextStyle(CustomScreenType screenType) {
    return customStyle(
      screenType,
      desktop: 18,
      tablet: 30,
      mobile: 80,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle skillTextStyle(CustomScreenType screenType) {
    return customStyle(
      screenType,
      desktop: 20,
      tablet: 30,
      mobile: 70,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle projectTitleTextStyle(CustomScreenType screenType) {
    return customStyle(
      screenType,
      desktop: 25,
      tablet: 40,
      mobile: 90,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle sectionHeadingTextStyle(CustomScreenType screenType) {
    return customStyle(
      screenType,
      desktop: 34,
      tablet: 50,
      mobile: 90,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

}