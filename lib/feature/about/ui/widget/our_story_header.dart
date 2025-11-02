import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OurStoryHeader extends StatelessWidget {
  const OurStoryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
      padding: ResponsiveWidget.isSmallScreen(context)? EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h) : EdgeInsets.symmetric(horizontal: 100.w, vertical: 80.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: Text(
        'Our Story',
        style: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 48.sp,
          fontWeight: FontWeightHelper.semiBold,
        ),
      ),
    );
  }
}