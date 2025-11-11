import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/about/ui/widget/cta_section_widget.dart';
import 'package:craftechy_website/feature/careers/ui/widget/career_banner_widget.dart';
import 'package:craftechy_website/feature/careers/ui/widget/careers_part.dart';
import 'package:craftechy_website/feature/careers/ui/widget/jobs_part.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_header_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareersScreen extends StatelessWidget {
  const CareersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CareerBannerWidget(),
          ProcessHeaderWidget(
            title: 'Welcome to Craftechy, where talent meets opportunity!',
            description:
                'At Craftechy, we believe that the success of our agency lies in the talent, passion, and dedication of our team members. We are a digital product agency that thrives on innovation, creativity, and collaboration. If you\'re ready to make a difference and contribute to cutting-edge projects, we invite you to explore career opportunities with us.',
            subtitle: 'Why Work at Craftechy?',
          ),
          CareersPart(),
          Container(
            width: ResponsiveWidget.isLargeScreen(context)
                ? MediaQuery.of(context).size.width - 342.w
                : ResponsiveWidget.isMediumScreen(context)
                ? MediaQuery.of(context).size.width - 160.w
                : MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              vertical: 80.w,
              horizontal: 40.w,
            ).copyWith(bottom: 40.w),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColor.grayColor15,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: ResponsiveWidget.isSmallScreen(context)
                      ? 325.w
                      : 950.w,
                  child: Text(
                    'Current Openings',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 38.sp,
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                  ),
                ),
                verticalSpace(10),
                SizedBox(
                  width: ResponsiveWidget.isSmallScreen(context)
                      ? 325.w
                      : 950.w,
                  child: Text(
                    'We are always on the lookout for talented individuals who are passionate about creating exceptional digital experiences. Whether you\'re a designer, engineer, project manager, or have skills that align with our agency\'s mission, we encourage you to explore our open positions.',
                    style: TextStyle(
                      color: AppColor.grayColor90,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.regular,
                      height: 1.50,
                      letterSpacing: -0.10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          JobsPart(),
          CTASection(),
        ],
      ),
    );
  }
}


