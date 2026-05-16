import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';

class HeaderText extends StatelessWidget {
  final String title;
  const HeaderText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.white,width: 3)
          )
      ),
      padding: EdgeInsets.only(bottom: 5),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Text(title, style: AppTextStyles.heading2(context),),
    );
  }
}
