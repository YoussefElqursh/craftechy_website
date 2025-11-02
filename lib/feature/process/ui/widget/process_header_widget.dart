import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProcessHeaderWidget extends StatelessWidget {
  final String title;
  final String description;
  final String subtitle;

  const ProcessHeaderWidget({
    super.key,
    required this.title,
    required this.description,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
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
            width:ResponsiveWidget.isSmallScreen(context)? 325.w : 950.w,
            child: Text(
              title,
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 38.sp,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          ),
          verticalSpace(10),
          SizedBox(
            width: ResponsiveWidget.isSmallScreen(context)? 325.w : 950.w,
            child: Text(
              description,
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
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: ShapeDecoration(
              color: AppColor.grayColor15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            child: Text(
              subtitle,
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
