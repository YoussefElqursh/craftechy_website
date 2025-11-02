import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/about/ui/widget/cta_section_widget.dart';
import 'package:craftechy_website/feature/careers/data/data.dart';
import 'package:craftechy_website/feature/careers/ui/widget/career_banner_widget.dart';
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
            title: 'Welcome to SquareUp, where talent meets opportunity!',
            description:
            'At SquareUp, we believe that the success of our agency lies in the talent, passion, and dedication of our team members. We are a digital product agency that thrives on innovation, creativity, and collaboration. If you\'re ready to make a difference and contribute to cutting-edge projects, we invite you to explore career opportunities with us.',
            subtitle: 'Why Work at SquareUp?',
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
                double itemWidth = ResponsiveWidget. isSmallScreen(context)? (constraints.maxWidth) : (constraints.maxWidth) / 2;
                return Wrap(
                  children: List.generate(listOFCareers.length, (index) {
                    return SizedBox(
                        width: itemWidth,
                        child: Container(
                          height: ResponsiveWidget.isSmallScreen(context)? 420.h : ResponsiveWidget.isMediumScreen(context)? 450.h : 470.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveWidget.isLargeScreen(context) ? 50.w : ResponsiveWidget.isMediumScreen(context) ? 40.w : 24.w ,
                            vertical: ResponsiveWidget.isLargeScreen(context) ? 100.h : ResponsiveWidget.isMediumScreen(context) ? 80.h : 40.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: AppColor.grayColor15,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                listOFCareers[index]['title']!,
                                style: TextStyle(
                                  color: AppColor.greenColor80,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeightHelper.medium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: ResponsiveWidget.isLargeScreen(context) ? 50.h : ResponsiveWidget.isMediumScreen(context) ? 40.h : 20.h,),
                                child: Divider(
                                  color: AppColor.grayColor15,
                                ),
                              ),
                              Text(
                                listOFCareers[index]['description']!,
                                style: TextStyle(
                                  color: AppColor.grayColor90,
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeightHelper.regular,
                                  height: 1.50,
                                  letterSpacing: -0.10,
                                ),
                                maxLines: 8,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                    );
                  }),
                );
              },
            ),
          ),
          CTASection(),
        ],
      ),
    );
  }
}


