import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:craftechy_website/feature/home/ui/widget/introduction_part/trusted_company_widget.dart';
import 'package:craftechy_website/feature/home/ui/widget/introduction_part/we_for_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class IntroductionPart extends StatelessWidget {
  const IntroductionPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 160.w,
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
                padding: EdgeInsets.only(top: 80.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'A Digital Product Studio\nthat will Work',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 68.sp,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                    verticalSpace(40.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.w,
                        vertical: 24.h,
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
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
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
                          onPressed: () {},
                          color: AppColor.grayColor25,
                          textColor: AppColor.whiteColor,
                          borderSide: BorderSide(
                            color: AppColor.grayColor20,
                          ),
                        ),
                        CommonBtnWidget(
                          title: 'Contact Us',
                          onPressed: () {},
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
        Container(
          width: MediaQuery.of(context).size.width - 160.w,
          padding: const EdgeInsets.symmetric(vertical: 30),
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
              TrustedCompanyWidget(
                image: 'assets/icons/zapier.svg',
              ),
              TrustedCompanyWidget(
                image: 'assets/icons/spotify.svg',
              ),
              TrustedCompanyWidget(image: 'assets/icons/zoom.svg'),
              TrustedCompanyWidget(image: 'assets/icons/slack.svg'),
              TrustedCompanyWidget(
                image: 'assets/icons/amazon.svg',
              ),
              TrustedCompanyWidget(image: 'assets/icons/adobe.svg'),
            ],
          ),
        ),
      ],
    );
  }
}