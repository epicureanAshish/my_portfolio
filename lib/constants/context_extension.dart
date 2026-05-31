import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {

  /// Screen Width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Screen Height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Status Bar Height
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Bottom Padding
  double get bottomPadding => MediaQuery.of(this).padding.bottom;

  /// Keyboard Height
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  /// Orientation
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Device Type
  bool get isMobile => screenWidth < 700;

  bool get isTablet =>
      screenWidth >= 700 && screenWidth < 1100;

  bool get isDesktop => screenWidth >= 1100;
}