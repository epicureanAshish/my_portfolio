import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/fade_slide_section.dart';
import 'package:my_portfolio/widgets/responsive_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSection(
      child: FadeSlideSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About Me',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Ashish Chauhan is a mobile app developer with 4+ years of experience specializing in Flutter for cross-platform apps. He has freelanced as an Android developer and has deep expertise in Jetpack Compose.',
            ),
          ],
        ),
      ),
    );
  }
}

