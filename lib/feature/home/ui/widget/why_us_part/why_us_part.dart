import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/home/ui/widget/why_us_part/why_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhyUsPart extends StatelessWidget {
  const WhyUsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 160.w,
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
          width: MediaQuery.of(context).size.width - 160.w,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColor.grayColor15,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  WhyUsWidget(
                    icon: 'assets/icons/experience.svg',
                    title: 'Experience',
                    description:
                        'Our team consists of highly skilled professionals who have a deep understanding of the digital landscape. We stay updated with the latest industry trends and best practices to deliver cutting-edge solutions.',
                  ),
                  WhyUsWidget(
                    icon: 'assets/icons/client_centric_approach.svg',
                    title: 'Client-Centric Approach',
                    description:
                        'We prioritize our clients and their unique needs. We listen to your ideas, challenges, and goals, and tailor our services to meet your specific requirements. Your success is our success.',
                  ),
                ],
              ),
              Row(
                children: [
                  WhyUsWidget(
                    title: 'Results-Driven Solutions',
                    description:
                        'Our primary focus is on delivering results. We combine creativity and technical expertise to create digital products that drive business growth, enhance user experiences, and provide a competitive advantage.',
                    icon: 'assets/icons/results_driven_solutions.svg',
                  ),
                  WhyUsWidget(
                    title: 'Collaborative Partnership',
                    description:
                        'We value long-term relationships with our clients. We see ourselves as your digital partner, providing ongoing support, maintenance, and updates to ensure your digital products continue to thrive.',
                    icon: 'assets/icons/collaborative_partnership.svg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
