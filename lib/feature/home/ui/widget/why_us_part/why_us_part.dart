import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/home/ui/widget/why_us_part/why_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhyUsPart extends StatelessWidget {
  const WhyUsPart({super.key});

  @override
  Widget build(BuildContext context) {
    List listOFWhyUs = [
      {
        'icon': 'assets/icon/experience.svg',
        'title': 'Experience',
        'description':
            'Our team consists of highly skilled professionals who have a deep understanding of the digital landscape. We stay updated with the latest industry trends and best practices to deliver cutting-edge solutions.',
      },
      {
        'icon': 'assets/icon/client_centric_approach.svg',
        'title': 'Client-Centric Approach',
        'description':
            'We prioritize our clients and their unique needs. We listen to your ideas, challenges, and goals, and tailor our services to meet your specific requirements. Your success is our success.',
      },
      {
        'icon': 'assets/icon/results_driven_solutions.svg',
        'title': 'Results-Driven Solutions',
        'description':
            'Our primary focus is on delivering results. We combine creativity and technical expertise to create digital products that drive business growth, enhance user experiences, and provide a competitive advantage.',
      },
      {
        'icon': 'assets/icon/collaborative_partnership.svg',
        'title': 'Collaborative Partnership',
        'description':
            'We value long-term relationships with our clients. We see ourselves as your digital partner, providing ongoing support, maintenance, and updates to ensure your digital products continue to thrive.',
      },
    ];

    return Column(
      children: [
        Container(
          width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
          height: 280.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColor.grayColor15,
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/why_us.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColor.grayColor15,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double itemWidth = ResponsiveWidget.isSmallScreen(context)? (constraints.maxWidth) : (constraints.maxWidth) / 2;
              return Wrap(
                children: List.generate(listOFWhyUs.length, (index) {
                  return SizedBox(
                    width: itemWidth,
                    child: WhyUsWidget(
                      icon: listOFWhyUs[index]['icon']!,
                      title: listOFWhyUs[index]['title']!,
                      description: listOFWhyUs[index]['description']!,
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}