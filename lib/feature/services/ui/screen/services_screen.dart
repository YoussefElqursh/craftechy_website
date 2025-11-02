import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:craftechy_website/feature/home/ui/widget/our_services_part/our_services_banner.dart';
import 'package:craftechy_website/feature/services/data/data.dart';
import 'package:craftechy_website/feature/services/ui/widget/service_item.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart'as svg;
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OurServicesBanner(),
          ServiceItem(
            title: 'Design',
            description:
            'At Craftechy, our design team is passionate about creating stunning, user-centric designs that captivate your audience and elevate your brand. We believe that great design is not just about aesthetics; it\'s about creating seamless and intuitive user experiences. ',
            subtitle: 'Our design services include:',
            listOfServices1: uxListOfServices,
            listOfServices2: uiListOfServices,
            listOfServices3: diListOfServices,
          ),
          ServiceItem(
            title: 'Engineering',
            description:
            'Our engineering team combines technical expertise with a passion for innovation to build robust and scalable digital solutions. We leverage the latest technologies and best practices to deliver high-performance applications tailored to your specific needs.',
            subtitle: 'Our engineering services include:',
            listOfServices1: webListOfServices,
            listOfServices2: mobileListOfServices,
            listOfServices3: customListOfServices,
          ),
          ServiceItem(
            title: 'Project Management',
            description:'Our experienced project management team ensures that your projects are delivered on time, within budget, and according to your specifications. We follow industry-standard methodologies and employ effective communication and collaboration tools to keep you informed throughout the development process.',
            subtitle: 'Our project management services include:',
            listOfServices1: ppListOfServices,
            listOfServices2: adListOfServices,
            listOfServices3: qtListOfServices,
          ),
          Container(
            width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
            height: 510.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/get_in_touch.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColor.grayColor15,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: svg.Svg('assets/icons/Logo.svg'),
                  width: 60.w,
                  height: 60.h,
                ),
                verticalSpace(40),
                SizedBox(
                  width: 780,
                  child: Text(
                    'Let us Bring your Ideas to Life in the Digital World.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                ),
                verticalSpace(10),
                SizedBox(
                  width: 780,
                  child: Text(
                    'No matter which services you choose, we are committed to delivering exceptional results that exceed your expectations. Our multidisciplinary team works closely together to ensure seamless collaboration and a unified vision for your digital product.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.grayColor90,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.regular,
                      height: 1.50,
                      letterSpacing: -0.10,
                    ),
                  ),
                ),
                verticalSpace(40),
                CommonBtnWidget(
                  title: 'Start Project',
                  borderSide: BorderSide.none,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


