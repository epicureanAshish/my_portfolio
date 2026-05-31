import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/utils.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Null Function() onPressed;
  final CustomScreenType screenType;
  const ElevatedButtonWidget({super.key, required this.title, required this.icon, required this.onPressed, required this.screenType, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purpleColor1,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: screenType==CustomScreenType.desktop?32:screenType==CustomScreenType.tablet?20:20,
          vertical: screenType==CustomScreenType.desktop?22:screenType==CustomScreenType.tablet?10:10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              title,
              style: AppTextStyles.buttonTextStyle(screenType)
          ),
          SizedBox(width: 10),
          Icon(icon),
        ],
      ),
    );
  }
}
