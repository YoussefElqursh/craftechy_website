import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/icon_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhyUsWidget extends StatelessWidget {
  final String title;
  final String description;
  final String icon;

  const WhyUsWidget({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColor.grayColor15,
              ),
            ),
            padding: const EdgeInsets.all(60),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30.h,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 14.h,
                  children: [
                    IconContainerWidget(image: icon),
                    SizedBox(
                      width: 170.w,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeightHelper.medium,
                          height: 1.50,
                          letterSpacing: -0.12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 400.w,
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
              ],
            ),
          )
        : Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColor.grayColor15,
            ),
          ),
          padding: const EdgeInsets.all(60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 14,
                children: [
                  IconContainerWidget(image: icon),
                  SizedBox(
                    width: 170.w,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeightHelper.medium,
                        height: 1.50,
                        letterSpacing: -0.12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 400.w,
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
            ],
          ),
        );
  }
}
