
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/fade_slide_section.dart';
import 'package:my_portfolio/widgets/responsive_section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSection(
      child: FadeSlideSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Skills',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('• Flutter, Android (Jetpack Compose, XML), Dart, Kotlin, Java'),
            Text('• State Management: GetX, Bloc, Provider'),
            Text('• Tools: Android Studio, Xcode, VS Code, Git, Postman'),
            Text('• Firebase, SQLite, Hive, Sqflite'),
            Text('• REST APIs, WebSockets, Maps, Video Call SDKs, Payments'),
            Text('• CI/CD: Play Console, TestFlight, App Distribution'),
          ],
        ),
      ),
    );
  }
}