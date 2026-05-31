
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/context_extension.dart';
import 'package:my_portfolio/constants/utils.dart';

class ProjectMobileCard extends StatelessWidget {
  final Map project;
  const ProjectMobileCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20),

        borderOnForeground: true,
        shadowColor: Colors.white,
        color: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height:60,
                    width:60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          child: Image.network(
                            project["icon"],
                            fit: BoxFit.fitHeight,)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(project["title"],
                        style: AppTextStyles.sectionTitle(context),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getCustomScreenType(context) == CustomScreenType.mobile ? 10.h :20.h,),
              Divider(color: Colors.white70,),
              SizedBox(height: getCustomScreenType(context) == CustomScreenType.mobile ? 10.h :20.h,),
              Text(
                project["description"],
                overflow: TextOverflow.ellipsis,
                maxLines: 50,
                style: AppTextStyles.bodyLarge(context),),
            ],
          ),
        ),
      ),
    );
  }
}
