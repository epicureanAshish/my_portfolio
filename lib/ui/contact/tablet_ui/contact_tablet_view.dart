
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/fade_slide_section.dart';
import 'package:my_portfolio/widgets/responsive_section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSection(
      child: FadeSlideSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Contact Me',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('📧 ashishchauhan0206@gmail.com'),
            // Text('📱 9882328370'),
            Text('📍 Punjab, India'),
            Text('LinkedIn: ashish-chauhan-6b9069141'),
            Text('GitHub: epicureanAshish'),
          ],
        ),
      ),
    );
  }
}