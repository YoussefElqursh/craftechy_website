import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/careers/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareersItem extends StatelessWidget {
  final int index;
  const CareersItem({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWidget.isSmallScreen(context)? 420.h : ResponsiveWidget.isMediumScreen(context)? 460.h : 470.h,
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
    );
  }
}