import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBtnWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final BorderSide borderSide;

  const CommonBtnWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.color = AppColor.greenColor50,
    this.textColor = AppColor.grayColor15,
    required this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: ResponsiveWidget.isLargeScreen(context)? 60.h : ResponsiveWidget.isMediumScreen(context)? 45.h : 58.h,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(6.r),
        side: borderSide,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 14.sp,
          fontWeight: FontWeightHelper.medium,
          height: 1.50,
        ),
      ),
    );
  }
}
