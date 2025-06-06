
import 'package:flutter/material.dart';

class ResponsiveSection extends StatelessWidget {
  final Widget child;
  const ResponsiveSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width >= 1200
                ? 1100
                : width >= 800
                ? 800
                : width * 0.9,
          ),
          child: child,
        ),
      ),
    );
  }
}
