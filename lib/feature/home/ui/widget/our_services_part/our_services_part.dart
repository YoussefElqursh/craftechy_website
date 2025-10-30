import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/home/ui/widget/our_services_part/our_service_widget.dart';
import 'package:craftechy_website/feature/home/ui/widget/our_services_part/our_services_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OurServicePart extends StatelessWidget {
  const OurServicePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OurServicesBanner(),
        Container(
          width: MediaQuery.of(context).size.width - 160.w,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColor.grayColor15,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OurServiceWidget(
                header: 'Design',
                description:
                'At Squareup, our design team is passionate about creating stunning, user-centric designs that captivate your audience and elevate your brand. We believe that great design is not just about aesthetics; it\'s about creating seamless and intuitive user experiences.',
                image: 'assets/icons/design.svg',
              ),
              OurServiceWidget(
                header: 'Engineering',
                description:
                'Our engineering team combines technical expertise with a passion for innovation to build robust and scalable digital solutions. We leverage the latest technologies and best practices to deliver high-performance applications tailored to your specific needs.',
                image: 'assets/icons/engineering.svg',
              ),
              OurServiceWidget(
                header: 'Project Management',
                description:
                'Our experienced project management team ensures that your projects are delivered on time, within budget, and according to your specifications. We follow industry-standard methodologies and employ effective communication and collaboration tools to keep you informed throughout the development process.',
                image: 'assets/icons/project_management.svg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}