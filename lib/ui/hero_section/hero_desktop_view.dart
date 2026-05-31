import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:my_portfolio/widgets/elevated_button_widget.dart';
import 'package:my_portfolio/widgets/outlined_button_widget.dart';

class HeroDesktopView extends StatelessWidget {
  final Map bio;
  final void Function() onViewMyWorkTap;
  const HeroDesktopView(this.bio, {super.key, required this.onViewMyWorkTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1100;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 40 : 20,
      ),
      child: isMobile
          ? Column(
        children: [
          _buildLeftContent(isMobile, isTablet),
          const SizedBox(height: 40),
          _buildRightImage(isMobile, isTablet),
        ],
      )
          : Row(
        children: [
          Expanded(
            flex: 5,
            child: _buildLeftContent(isMobile, isTablet),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 4,
            child: _buildRightImage(isMobile, isTablet),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftContent(bool isMobile, bool isTablet) {
    return bio=={}?const SizedBox.shrink():Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),

          child: Text(
            bio['designation'],
            style: AppTextStyles.designationStyle(CustomScreenType.desktop)

          ),
        ),
        const SizedBox(height: 30),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: bio['title_white_1'],
                style: AppTextStyles.profileTitleStyle(CustomScreenType.desktop),
              ),
              TextSpan(
                text: bio['title_purple'],
                style: AppTextStyles.profileTitleStyle(CustomScreenType.desktop).copyWith(color: AppColors.purpleColor2)
              ),
              TextSpan(
                text: bio['title_white_2'],
                style: AppTextStyles.profileTitleStyle(CustomScreenType.desktop),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        SizedBox(
          width: isMobile ? double.infinity : 600,
          child: Text(
            bio['description'],
            style: AppTextStyles.bioDescStyle(CustomScreenType.desktop)
          ),
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ElevatedButtonWidget(
              screenType: CustomScreenType.desktop,
                title: bio['primary_button'],
                icon: Icons.arrow_forward_rounded,
                onPressed: () {
                  onViewMyWorkTap();
                }
            ),
            OutlinedButtonWidget(
                screenType: CustomScreenType.desktop,
                title: bio['secondary_button'],
                icon: Icons.chat_bubble_outline_rounded,
                onPressed: () {
                }
            ),
          ],
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 30,
          runSpacing: 20,
          children: [
            _InfoItem(
              icon: Icons.email_outlined,
              text: bio['contact_info']['email'],
            ),
            _InfoItem(
              icon: Icons.phone_outlined,
              text: bio['contact_info']['phone'],
            ),
            _InfoItem(
              icon: Icons.location_on_outlined,
              text: bio['contact_info']['location'],
            ),
          ],
        )
      ],
    );
  }

  Widget _buildRightImage(bool isMobile, bool isTablet) {
    final imageSize = isMobile
        ? 320.0
        : isTablet
        ? 450.0
        : 560.0;

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
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            child: _skillBadge(bio['main_skills']['skill_1']),
          ),
          Positioned(
            top: 180,
            left: -10,
            child: _skillBadge(bio['main_skills']['skill_2']),
          ),
          Positioned(
            top: 60,
            right: 0,
            child: _skillBadge(bio['main_skills']['skill_3']),
          ),
          Positioned(
            bottom: 120,
            right: -10,
            child: _skillBadge(bio['main_skills']['skill_4']),
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
        children: [
          Image.network(skill['image'], height: 20,),
          SizedBox(width: 15,),
          Text(
            skill['name'],
            style: AppTextStyles.skillTextStyle(CustomScreenType.desktop)
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: AppColors.purpleColor3,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: AppTextStyles.bioDescStyle(CustomScreenType.desktop)
        ),
      ],
    );
  }
}