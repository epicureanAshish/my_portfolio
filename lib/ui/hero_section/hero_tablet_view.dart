import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/widgets/elevated_button_widget.dart';
import 'package:my_portfolio/widgets/outlined_button_widget.dart';

class HeroTabletView extends StatelessWidget {
  final Map bio;
  final void Function() onViewMyWorkTap;
  const HeroTabletView(this.bio, {super.key, required this.onViewMyWorkTap});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
              Expanded(
                flex: 7,
                child: _buildLeftContent(),
              ),
              const SizedBox(width: 40),
              Expanded(
                flex: 4,
                child: _buildRightImage(),
              ),
                      ],
                    ),
              const SizedBox(height: 10,),
              Wrap(
                spacing: 20,
                runSpacing: 10,
                children: [
                  _skillBadge(bio['main_skills']['skill_1']),
                  _skillBadge(bio['main_skills']['skill_2']),
                  _skillBadge(bio['main_skills']['skill_3']),
                  _skillBadge(bio['main_skills']['skill_4']),
                ],
              )
            ],
          ),
    );
  }

  Widget _buildLeftContent() {
    return bio=={}?const SizedBox.shrink():Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),

          child: Text(
              bio['designation'],
              style: AppTextStyles.designationStyle(CustomScreenType.tablet)

          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: bio['title_white_1'],
                style: AppTextStyles.profileTitleStyle(CustomScreenType.tablet),
              ),
              TextSpan(
                  text: bio['title_purple'],
                  style: AppTextStyles.profileTitleStyle(CustomScreenType.tablet).copyWith(color: AppColors.purpleColor2)
              ),
              TextSpan(
                text: bio['title_white_2'],
                style: AppTextStyles.profileTitleStyle(CustomScreenType.tablet),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 600,
          child: Text(
              bio['description'],
              style: AppTextStyles.bioDescStyle(CustomScreenType.tablet)
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ElevatedButtonWidget(
                screenType: CustomScreenType.tablet,
                title: bio['primary_button'],
                icon: Icons.arrow_forward_rounded,
                onPressed: () {
                  onViewMyWorkTap();
                }
            ),
            OutlinedButtonWidget(
                screenType: CustomScreenType.tablet,
                title: bio['secondary_button'],
                icon: Icons.chat_bubble_outline_rounded,
                onPressed: () {
                }
            ),
          ],
        ),

      ],
    );
  }

  Widget _buildRightImage() {
    final imageSize = 380.0;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.purpleAccent.withOpacity(0.4),
                  Colors.blue.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                bio['profile_image'],
                fit: BoxFit.fitHeight,
              ),
            ),
          ),


        ],
      ),
    );
  }

  Widget _skillBadge(Map skill) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(skill['image'], height: 20,),
          SizedBox(width: 15,),
          Text(
              skill['name'],
              style: AppTextStyles.skillTextStyle(CustomScreenType.tablet)
          ),
        ],
      ),
    );
  }
}

