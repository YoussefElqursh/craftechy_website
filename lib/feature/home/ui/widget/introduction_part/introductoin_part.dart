import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/routing/routes.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:craftechy_website/feature/home/ui/widget/introduction_part/trusted_company_widget.dart';
import 'package:craftechy_website/feature/home/ui/widget/introduction_part/we_for_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class IntroductionPart extends StatelessWidget {
  const IntroductionPart({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> trustedCompanies = [
      'assets/icons/zapier.svg',
      'assets/icons/spotify.svg',
      'assets/icons/zoom.svg',
      'assets/icons/slack.svg',
      'assets/icons/amazon.svg',
      'assets/icons/adobe.svg',
    ];
    return Column(
      children: [
        Container(
          width: ResponsiveWidget.isLargeScreen(context)
              ? MediaQuery.of(context).size.width - 342.w
              : ResponsiveWidget.isMediumScreen(context)
              ? MediaQuery.of(context).size.width - 160.w
              : MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColor.grayColor15,
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 200.h, bottom: 0.h),
                child: SvgPicture.asset(
                  'assets/icons/Abstract Design.svg',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 80.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'A Digital Product Studio\nthat will Work',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: ResponsiveWidget.isLargeScreen(context)
                            ? 68.sp
                            : ResponsiveWidget.isMediumScreen(context)
                            ? 48.sp
                            : 34.sp,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                    verticalSpace(40),
                    ResponsiveWidget.isSmallScreen(context)
                        ? Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 18.h,
                            ),
                            decoration: ShapeDecoration(
                              color: AppColor.grayColor25,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: AppColor.grayColor15,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: SizedBox(
                              width: 318.w,
                              child: Text(
                                'For startups, enterprise leaders, media & publishers, and social good.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColor.grayColor60,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeightHelper.regular,
                                  height: 1.50,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            padding: ResponsiveWidget.isLargeScreen(context)
                                ? EdgeInsets.symmetric(
                                    horizontal: 40.w,
                                    vertical: 24.h,
                                  )
                                : EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 12.h,
                                  ),
                            decoration: ShapeDecoration(
                              color: AppColor.grayColor25,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.w,
                                  color: AppColor.grayColor15,
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 6.w,
                              children: [
                                Text(
                                  'For',
                                  style: TextStyle(
                                    color: AppColor.grayColor60,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeightHelper.regular,
                                  ),
                                ),
                                horizontalSpace(10),
                                WeForWidget(kind: 'Startups'),
                                Text(
                                  ',',
                                  style: TextStyle(
                                    color: AppColor.grayColor60,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeightHelper.regular,
                                  ),
                                ),
                                WeForWidget(kind: 'Enterprise leaders'),
                                Text(
                                  ',',
                                  style: TextStyle(
                                    color: AppColor.grayColor60,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeightHelper.regular,
                                  ),
                                ),
                                WeForWidget(kind: 'Media & Publishers'),
                                Text(
                                  'and',
                                  style: TextStyle(
                                    color: AppColor.grayColor60,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeightHelper.regular,
                                  ),
                                ),
                                WeForWidget(kind: 'Social Good'),
                              ],
                            ),
                          ),
                    verticalSpace(50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 13.w,
                      children: [
                        CommonBtnWidget(
                          title: 'Our Works',
                          onPressed: () {
                            context.go(Routes.workRoute);
                          },
                          color: AppColor.grayColor25,
                          textColor: AppColor.whiteColor,
                          borderSide: BorderSide(color: AppColor.grayColor20),
                        ),
                        CommonBtnWidget(
                          title: 'Contact Us',
                          onPressed: () {
                            context.go(Routes.contactRoute);
                          },
                          borderSide: BorderSide.none,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ResponsiveWidget.isSmallScreen(context)
            ? Container(
                width:MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  color: AppColor.grayColor25,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: AppColor.grayColor15,
                    ),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double itemWidth = (constraints.maxWidth) / 2;
                    return Wrap(
                      children: List.generate(trustedCompanies.length, (index) {
                        return Container(
                          padding: EdgeInsets.all( 30.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: AppColor.grayColor15,
                            ),
                          ),
                          width: itemWidth,
                          child: TrustedCompanyWidget(
                            image: trustedCompanies[index],
                          ),
                        );
                      }),
                    );
                  },
                ),
              )
            : Container(
                width: ResponsiveWidget.isLargeScreen(context)
                    ? MediaQuery.of(context).size.width - 342.w
                    : ResponsiveWidget.isMediumScreen(context)
                    ? MediaQuery.of(context).size.width - 160.w
                    : MediaQuery.of(context).size.width,
                padding: ResponsiveWidget.isLargeScreen(context)
                    ? EdgeInsets.symmetric(vertical: 40.h)
                    : EdgeInsets.symmetric(vertical: 30.h),
                decoration: ShapeDecoration(
                  color: AppColor.grayColor25,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: AppColor.grayColor15,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TrustedCompanyWidget(image: 'assets/icons/zapier.svg'),
                    TrustedCompanyWidget(image: 'assets/icons/spotify.svg'),
                    TrustedCompanyWidget(image: 'assets/icons/zoom.svg'),
                    TrustedCompanyWidget(image: 'assets/icons/slack.svg'),
                    TrustedCompanyWidget(image: 'assets/icons/amazon.svg'),
                    TrustedCompanyWidget(image: 'assets/icons/adobe.svg'),
                  ],
                ),
              ),
      ],
    );
  }
}
