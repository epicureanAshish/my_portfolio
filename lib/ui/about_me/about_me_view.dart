
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/widgets/outlined_button_widget.dart';

class AboutMeView extends StatelessWidget {
  final String aboutMeData;
  final void Function() onExploreMoreTap;

  const AboutMeView({super.key, required this.aboutMeData, required this.onExploreMoreTap});

  @override
  Widget build(BuildContext context) {
    return aboutMeData.isEmpty ? const SizedBox.shrink() : SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(getCustomScreenType(context)==CustomScreenType.desktop?36:20,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white.withOpacity(0.04),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.code_rounded, color: AppColors.purpleColor3),
                SizedBox(width: 12),
                Text(
                  'About Me',
                  style: AppTextStyles.sectionHeadingTextStyle(getCustomScreenType(context))
                ),
              ],
            ),

            SizedBox(height: getCustomScreenType(context)==CustomScreenType.desktop?30:10),
            Text(
                aboutMeData,
                style: AppTextStyles.bioDescStyle(getCustomScreenType(context))),
            SizedBox(height: getCustomScreenType(context)==CustomScreenType.desktop?30:10),
            OutlinedButtonWidget(
                screenType: getCustomScreenType(context),
                title: 'Explore More',
                icon: Icons.arrow_forward_rounded,
                onPressed: () {
                  onExploreMoreTap.call();
                }
            ),
          ],
        ),
      ),
    );
  }
}
