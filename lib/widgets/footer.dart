import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/utils.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("🔗 Let's Connect",
          style: TextStyle(fontSize: 16, color: Colors.white),),
        SizedBox(height: 10,),
        RichText(text: TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.white),
            children: [
              TextSpan(text: "LinkedIn", recognizer: TapGestureRecognizer()..onTap = () { launchUrlMethod("https://www.linkedin.com/in/ashish-chauhan-6b9069141/");},),
              WidgetSpan(child: SizedBox(width: 20,)),
              TextSpan(text: "GitHub", recognizer: TapGestureRecognizer()..onTap = () { launchUrlMethod("https://github.com/epicureanAshish?tab=repositories");},),
              WidgetSpan(child: SizedBox(width: 20,)),
              TextSpan(text: "Email", recognizer: TapGestureRecognizer()..onTap = () { launchUrlMethod("mailto:ashishchauhan0206@gmail.com");},),
            ]
        )),

        SizedBox(height: 10,),
        Text(
          "Made with Flutter ❤️ | © 2025 Ashish Chauhan. All rights reserved.",
          style: TextStyle(fontSize: 16, color: Colors.white),),
      ],
    );
  }
}
