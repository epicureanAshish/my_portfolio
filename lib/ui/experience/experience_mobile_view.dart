import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/app_text_styles.dart';
import 'package:my_portfolio/constants/utils.dart';
import 'package:timelines_plus/timelines_plus.dart';

class ExperienceMobileView extends StatelessWidget {
  final List experience;

  const ExperienceMobileView(this.experience, {super.key});

  @override
  Widget build(BuildContext context) {
    return experience.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.timeline_rounded, color: AppColors.purpleColor3),
              SizedBox(width: 12),
              Text(
                  'Experience Timeline',
                  style: AppTextStyles.sectionHeadingTextStyle(CustomScreenType.mobile)
              ),
            ],
          ),


          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Timeline.tileBuilder(
              padding: EdgeInsets.zero,
              theme: TimelineThemeData(
                  nodePosition: 0,
                  connectorTheme: const ConnectorThemeData(
                    thickness: 1.0,
                    color: AppColors.purpleColor3,
                  ),
                  indicatorTheme: const IndicatorThemeData(size: 15.0),
                  indicatorPosition: 0.1
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,

                contentsAlign: ContentsAlign.basic,

                itemCount: experience.length,

                connectorBuilder: (_, index, __) {
                  if (index == 0) {
                    return const SolidLineConnector(
                      color: Color(0xff6ad192),
                    );
                  } else {
                    return const SolidLineConnector();
                  }
                },
                indicatorBuilder: (_, index) {
                  switch (index) {
                    case 0:
                      return const OutlinedDotIndicator(
                        size: 30,
                        color: AppColors.purpleColor3,
                        child: Icon(
                          Icons.circle,
                          color: AppColors.purpleColor3,
                          size: 20.0,
                        ),
                      );
                    default:
                      return const OutlinedDotIndicator(
                        size: 30,
                        color: AppColors.purpleColor1,

                      );
                  }
                },

                /// CONTENT
                contentsBuilder: (context, index) {
                  final item = experience[index];

                  return Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 20),
                    padding: const EdgeInsets.all(15),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TOP ROW
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      item['company'],
                                      style: AppTextStyles.sectionHeadingTextStyle(CustomScreenType.mobile)
                                  ),

                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.white.withOpacity(0.03),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.08),
                                      ),
                                    ),
                                    child: Text(
                                        item['duration'],
                                        style: AppTextStyles.bioDescStyle(CustomScreenType.mobile)
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Text(
                                      item['role'],
                                      style: AppTextStyles.bioDescStyle(CustomScreenType.mobile)
                                  ),
                                ],
                              ),
                            ),



                          ],
                        ),

                        const SizedBox(height: 24),


                        /// DESCRIPTION
                        Column(
                          children: List.generate(
                            item['description'].length,
                                (i) {
                              final description = item['description'][i];

                              return Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 12,
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white70,
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: Text(
                                          description,
                                          style: AppTextStyles.bioDescStyle(CustomScreenType.mobile)
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
