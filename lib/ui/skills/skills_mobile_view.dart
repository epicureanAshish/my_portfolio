import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/utils.dart';

class SkillsMobileView extends StatelessWidget {
  final List skills;
  const SkillsMobileView(this.skills, {super.key});

  final double iconSize = 25.0;

  @override
  Widget build(BuildContext context) {
    return skills.isEmpty?const SizedBox.shrink():Container(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(15),
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
                    'Tech Stack',
                    style: AppTextStyles.sectionHeadingTextStyle(CustomScreenType.mobile)
                ),
              ],
            ),

            const SizedBox(height: 30),

            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: skills.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                childAspectRatio: 3.4,
              ),
              itemBuilder: (context, index) {
                var item = skills[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white.withOpacity(0.03),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                    ),
                  ),
                  child: Row(
                    children: [
                      item['image'].toString().endsWith("svg")
                          ? SvgPicture.network(
                        item['image'],
                        height: iconSize,
                        width: iconSize,
                      )
                          : Image.network(
                        item['image'],
                        height: iconSize,
                        width: iconSize,
                        errorBuilder: (a, b, c) => Icon(
                          Icons.flash_on_rounded,
                          color: Colors.purpleAccent,
                          size: iconSize,
                        ),
                      ),

                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                            item['name'],
                            style: AppTextStyles.skillTextStyle(CustomScreenType.mobile)
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
