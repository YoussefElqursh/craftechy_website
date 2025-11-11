import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
class AboutHeader extends StatelessWidget {
  const AboutHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width - 342.w
          : ResponsiveWidget.isMediumScreen(context)
          ? MediaQuery.of(context).size.width - 160.w
          : MediaQuery.of(context).size.width,
      padding: ResponsiveWidget.isSmallScreen(context)? EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h) : EdgeInsets.symmetric(horizontal: 100.w, vertical: 80.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 290.w,
                child: Text(
                  'About Craftechy',
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 38.sp,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ),
              verticalSpace(16),
              SizedBox(
                width: 290.w,
                child: Text(
                  'Craftechy is a digital product agency that is passionate about crafting exceptional digital experiences. We specialize in design, engineering, and project management, helping businesses thrive in the digital landscape. At Craftechy, we follow a structured and collaborative process to ensure the successful delivery of exceptional digital products. Our process combines industry best practices, creative thinking, and a client-centric approach.',
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeightHelper.regular,
                    height: 1.50,
                    letterSpacing: -0.10,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(16),
          Container(
            width: 490.w,
            height: 490.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColor.grayColor15,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/About1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image(
                image: svg.Svg('assets/icon/Logo.svg'),
                width: 100.w,
                height: 100.h,
              ),
            ),
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 290.w,
                child: Text(
                  'About Craftechy',
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 38.sp,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ),
              verticalSpace(16),
              SizedBox(
                width: 290.w,
                child: Text(
                  'Craftechy is a digital product agency that is passionate about crafting exceptional digital experiences. We specialize in design, engineering, and project management, helping businesses thrive in the digital landscape. At Craftechy, we follow a structured and collaborative process to ensure the successful delivery of exceptional digital products. Our process combines industry best practices, creative thinking, and a client-centric approach.',
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeightHelper.regular,
                    height: 1.50,
                    letterSpacing: -0.10,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 490.w,
            height: 490.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColor.grayColor15,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/About1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image(
                image: svg.Svg('assets/icon/Logo.svg'),
                width: 100.w,
                height: 100.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}