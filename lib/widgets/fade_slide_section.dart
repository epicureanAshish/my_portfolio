
import 'package:animate_do/animate_do.dart' show FadeInUp;
import 'package:flutter/material.dart';

class FadeSlideSection extends StatelessWidget {
  final Widget child;
  const FadeSlideSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: child,
    );
  }
}