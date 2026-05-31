
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/utils.dart';

class ProjectTabletCard extends StatelessWidget {
  final Map project;
  const ProjectTabletCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getCustomScreenType(context) == CustomScreenType.desktop ? 280.h :280.h,
      width: (getCustomScreenType(context) ==
          CustomScreenType.desktop ? 1.sw / 3 :
      getCustomScreenType(context) ==
          CustomScreenType.tablet ? 1.sw / 2 :
      1.sw) - 40,
      child: Card(
        borderOnForeground: true,
        shadowColor: AppColors.cardShadowColor,
        color: AppColors.cardBackgroundColor,
        elevation: 20,
        child: Row(
          children: [
            Expanded(
              flex:1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Container(
                    height: getCustomScreenType(context) == CustomScreenType.mobile ? 1.sw :2.sw,
                    width: getCustomScreenType(context) == CustomScreenType.mobile ? 1.sw :2.sw,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Image.network(
                      project["icon"],fit: BoxFit.cover,)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment
                      .start,
                  children: [
                    Text(project["title"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getCustomScreenType(context)==CustomScreenType.tablet?40.sp:30.sp,
                          color: Colors.white),),
                    SizedBox(height: 20,),
                    Flexible(
                      child: Text(
                        project["description"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: AppTextStyles.bodyLarge(context),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
