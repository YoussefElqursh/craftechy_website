import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:craftechy_website/feature/process/ui/widget/get_touch_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
class GetInTouchPart extends StatelessWidget {
  const GetInTouchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
          height:  ResponsiveWidget.isLargeScreen(context)? 600.h : ResponsiveWidget.isMediumScreen(context)? 485.h : 900.h,
          padding: ResponsiveWidget.isLargeScreen(context)? EdgeInsets.symmetric(horizontal: 350.w, vertical: 120.h) : ResponsiveWidget.isMediumScreen(context)? EdgeInsets.symmetric(horizontal: 250.w, vertical: 85.h) : EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/get_in_touch.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColor.grayColor15,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: svg.Svg('assets/icon/Logo.svg'),
                width: 60.w,
                height: 60.h,
              ),
              ResponsiveWidget.isLargeScreen(context)? verticalSpace(50) :  ResponsiveWidget.isMediumScreen(context)? verticalSpace(40) : verticalSpace(28),
              SizedBox(
                width:  ResponsiveWidget.isSmallScreen(context)? 326.w : 780.w,
                child: Text(
                  'Thank you for your Interest in Craftechy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ),
              verticalSpace(10),
              SizedBox(
                width: ResponsiveWidget.isSmallScreen(context)? 326.w : 780.w,
                child: Text(
                  'We would love to hear from you and discuss how we can help bring your digital ideas to life. Here are the different ways you can get in touch with us.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.regular,
                    height: 1.50,
                    letterSpacing: -0.10,
                  ),
                ),
              ),
              ResponsiveWidget.isLargeScreen(context)? verticalSpace(50) :  ResponsiveWidget.isMediumScreen(context)? verticalSpace(40) : verticalSpace(28),
              CommonBtnWidget(
                title: 'Start Project',
                borderSide: BorderSide.none,
                onPressed: () {},
              ),
            ],
          ),
        ),
        GetTouchFormWidget(),
      ],
    );
  }
}
