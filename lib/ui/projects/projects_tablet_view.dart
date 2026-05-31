import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/utils.dart';

class ProjectsTabletView extends StatelessWidget {
  final List projects;

  const ProjectsTabletView(this.projects, {super.key});

  @override
  Widget build(BuildContext context) {
    return projects.isEmpty
        ? const SizedBox.shrink()
        : Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.work_outline_rounded,
                    color: AppColors.purpleColor3,
                  ),
                  SizedBox(width: 12),
                  Text(
                      'Featured Projects',
                      style: AppTextStyles.sectionHeadingTextStyle(
                          CustomScreenType.tablet)
                  ),
                ],
              ),
              // InkWell(
              //   onTap: () {
              //   },
              //   child: Text(
              //     'View All Projects',
              //     style: AppTextStyles.bioDescStyle(CustomScreenType.desktop).copyWith(
              //       color: AppColors.purpleColor3,
              //       fontWeight: FontWeight.w600
              //     )
              //   ),
              // ),
            ],
          ),

          const SizedBox(height: 36),

          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 22,
              mainAxisSpacing: 22,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final project = projects[index];

              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.white.withOpacity(0.04),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image
                        Image.network(
                          project['image'],
                          height: 50,
                          width: 50,
                          errorBuilder: (a, b, c) =>
                              Icon(
                                Icons.phone_android_rounded,
                                color: Colors.white,
                                size: 70,
                              ),
                        ),
                        SizedBox(width: 15,),
                        //Year
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.purpleAccent.withOpacity(
                                0.12),
                          ),
                          child: Text(
                            project['year'] as String,
                            style: AppTextStyles.bioDescStyle(
                                CustomScreenType.tablet).copyWith(
                              color: AppColors.purpleColor3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                        project['title'] as String,
                        style: AppTextStyles
                            .projectTitleTextStyle(
                            CustomScreenType.tablet)
                    ),
                    const SizedBox(height: 14),
                    Text(
                        project['description'] as String,
                        style: AppTextStyles.bioDescStyle(
                            CustomScreenType.tablet)
                    ),
                    const Spacer(),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: (project['tags'] as List<dynamic>)
                          .map(
                            (tag) =>
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white.withOpacity(0.05),
                              ),
                              child: Text(
                                  tag,
                                  style: AppTextStyles.bioDescStyle(
                                      CustomScreenType.tablet)
                              ),
                            ),
                      )
                          .toList(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
