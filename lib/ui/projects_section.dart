
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/fade_slide_section.dart';
import 'package:my_portfolio/widgets/responsive_section.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSection(
      child: FadeSlideSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Projects',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('• Gini Health AI – Personalized health tracking using Health Connect (2024)'),
            Text('• CloudPOS – Online order management app (2023–24)'),
            Text('• Fitwithpari – Fitness app with meal plans and live workouts (2023)'),
            Text('• ActivaTest – Competitive exam prep with mock tests and study material (2022)'),
          ],
        ),
      ),
    );
  }
}