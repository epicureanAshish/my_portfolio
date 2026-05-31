import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/utils.dart';

class Navbar extends StatelessWidget {
  final Map headerData;
  final VoidCallback onHomeTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;

  const Navbar(this.headerData, {
    super.key,
    required this.onHomeTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
  });

  @override
  Widget build(BuildContext context) {


    return headerData=={}?const SizedBox.shrink():Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: getCustomScreenType(context)==CustomScreenType.mobile?15:20,
        vertical: 24,
      ),
      child: getCustomScreenType(context)!=CustomScreenType.desktop ? _mobileNavbar(context) : _desktopNavbar(context),
    );
  }

  Widget _desktopNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.translate(
                offset: (Offset(0, 3)),
                child: Image.network(headerData['profile_logo'],height: 70, width: 70, color: AppColors.purpleColor3,)),
            SizedBox(width: 5),
            Text(
              headerData['name'],
              style: AppTextStyles.headerName(CustomScreenType.desktop)
            ),
          ],
        ),

        Row(
          children: [
            _navItem(context: context, headerData['tab_1'], onHomeTap),
            _navItem(context: context, headerData['tab_2'], onSkillsTap),
            _navItem(context: context, headerData['tab_3'], onProjectsTap),
            _navItem(context: context, headerData['tab_4'], onExperienceTap),
          ],
        ),
      ],
    );
  }

  Widget _mobileNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.translate(
                offset: (Offset(0, 3)),
                child: Image.network(headerData['profile_logo'],height: 70, width: 70, color: AppColors.purpleColor3,)),
            SizedBox(width: 5),
            Text(
              headerData['name'],
              style: AppTextStyles.headerName(getCustomScreenType(context))
            ),
          ],
        ),

        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: const Color(0xFF111827),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _mobileMenuItem(context, headerData['tab_1'], onHomeTap),
                      _mobileMenuItem(context, headerData['tab_2'], onSkillsTap),
                      _mobileMenuItem(context, headerData['tab_3'], onProjectsTap),
                      _mobileMenuItem(context, headerData['tab_4'], onExperienceTap),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: const Icon(Icons.menu_rounded, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _navItem(String title, VoidCallback onTap, {required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            title,
            style: AppTextStyles.headerTabs(CustomScreenType.desktop).copyWith(fontSize: 16)
          ),
        ),
      ),
    );
  }

  Widget _mobileMenuItem(
      BuildContext context,
      String title,
      VoidCallback onTap,
      ) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white.withOpacity(0.04),
        ),
        child: Text(
          title,
          style: AppTextStyles.headerTabs(getCustomScreenType(context))
        ),
      ),
    );
  }
}
