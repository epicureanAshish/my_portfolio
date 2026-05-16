import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/constants/utils.dart';


class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  final List<Map<String, dynamic>> timelineData = [
    {
      "year": "2019",
      "items": [
        "Native Android (Java), Retrofit REST API",
        "Freelance Android, MVVM, LiveData",
      ],
    },
    {
      "year": "2021",
      "items": [
        "Transitioned to Flutter for cross-platform development",
        "Animations & REST APIs",
        "State management (Provider & GetX)",
      ],
    },
    {
      "year": "2023",
      "items": [
        "State management (BLoC)",
        "Clean Architecture & SOLID principles",
        "CI/CD pipelines and build automation",
        "Enhanced unit and widget testing",
      ],
    },
    {
      "year": "2025",
      "items": [
        "Flutter web and Progressive Web Apps (PWA)",
        "Integrating AI-powered features",
        "App Security & Performance",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenType = getCustomScreenType(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: screenType == CustomScreenType.mobile
                ? 16.w
                : 40.w,
            vertical: 40.h,
          ),
          children: [
            Icon(
              Icons.rocket_launch,
              color: Colors.orange,
              size: screenType == CustomScreenType.mobile ? 28.sp : 40.sp,
            ),

            SizedBox(height: 10.h),

            Text(
              "My Journey in Code",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:
                screenType == CustomScreenType.mobile ? 28.sp : 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 12.h),

            Center(
              child: Container(
                width: screenType == CustomScreenType.mobile
                    ? 180.w
                    : 300.w,
                height: 4.h,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20.h),

            Text(
              "A visual walkthrough of my evolution as a developer",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize:
                screenType == CustomScreenType.mobile ? 14.sp : 18.sp,
              ),
            ),

            SizedBox(height: 60.h),

            ...List.generate(
              timelineData.length,
                  (index) => ResponsiveTimelineTile(
                year: timelineData[index]["year"],
                items:
                List<String>.from(timelineData[index]["items"]),
                isLeft: index.isEven,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveTimelineTile extends StatelessWidget {
  final String year;
  final List<String> items;
  final bool isLeft;

  const ResponsiveTimelineTile({
    super.key,
    required this.year,
    required this.items,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    final screenType = getCustomScreenType(context);

    final bool isMobile =
        screenType == CustomScreenType.mobile;

    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT SIDE
          if (!isMobile)
            Expanded(
              child: isLeft
                  ? _timelineCard(context)
                  : const SizedBox(),
            ),

          /// CENTER LINE
          SizedBox(
            width: isMobile ? 70.w : 120.w,
            child: Column(
              children: [
                Container(
                  width: 4.w,
                  height: 40.h,
                  color: Colors.pinkAccent,
                ),

                Container(
                  width: isMobile ? 55.w : 70.w,
                  height: isMobile ? 55.w : 70.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff120326),
                    border: Border.all(
                      color: const Color(0xffb14cff),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffb14cff)
                            .withOpacity(0.7),
                        blurRadius: 18,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      year,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 16.sp : 22.sp,
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 4.w,
                  height: 220.h,
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ),

          /// RIGHT SIDE
          Expanded(
            child: isMobile
                ? _timelineCard(context)
                : !isLeft
                ? _timelineCard(context)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _timelineCard(BuildContext context) {
    final screenType = getCustomScreenType(context);

    final bool isMobile =
        screenType == CustomScreenType.mobile;

    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      padding: EdgeInsets.all(
        isMobile ? 18.w : 28.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff0d031d),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: const Color(0xffb14cff),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffb14cff)
                .withOpacity(0.5),
            blurRadius: 18,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (e) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Text(
              "• $e",
              style: TextStyle(
                color: Colors.white,
                fontSize:
                isMobile ? 70.sp : 20.sp,
                height: 1.5,
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
