import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/about/ui/widget/cta_section_widget.dart';
import 'package:craftechy_website/feature/contact/ui/widget/contact_us_banner_widget.dart';
import 'package:craftechy_website/feature/home/ui/widget/faq_part/faq_part.dart';
import 'package:craftechy_website/feature/process/ui/widget/get_touch_form_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ContactUsBannerWidget(),
          Container(
            width: ResponsiveWidget.isLargeScreen(context)
                ? MediaQuery.of(context).size.width - 342.w
                : ResponsiveWidget.isMediumScreen(context)
                ? MediaQuery.of(context).size.width - 160.w
                : MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColor.grayColor15,
              ),
            ),
            child: ResponsiveWidget.isSmallScreen(context)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColor.grayColor15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 14,
                          children: [
                            SvgPicture.asset('assets/icons/email.svg'),
                            SelectableText(
                              'Craftechy.com',
                              style: TextStyle(
                                color: AppColor.grayColor90,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColor.grayColor15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 14,
                          children: [
                            SvgPicture.asset('assets/icons/phone.svg'),
                            SelectableText(
                              '+91 91813 23 2309',
                              style: TextStyle(
                                color: AppColor.grayColor90,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColor.grayColor15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 14,
                          children: [
                            SvgPicture.asset('assets/icons/location.svg'),
                            SelectableText(
                              'Get Location',
                              style: TextStyle(
                                color: AppColor.grayColor90,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColor.grayColor15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 14,
                          children: [
                            SvgPicture.asset('assets/icons/email.svg'),
                            SelectableText(
                              'Craftechy.com',
                              style: TextStyle(
                                color: AppColor.grayColor90,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColor.grayColor15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 14,
                          children: [
                            SvgPicture.asset('assets/icons/phone.svg'),
                            SelectableText(
                              '+91 91813 23 2309',
                              style: TextStyle(
                                color: AppColor.grayColor90,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColor.grayColor15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 14,
                          children: [
                            SvgPicture.asset('assets/icons/location.svg'),
                            SelectableText(
                              'Get Location',
                              style: TextStyle(
                                color: AppColor.grayColor90,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          GetTouchFormWidget(),
          Container(
            width: ResponsiveWidget.isLargeScreen(context)
                ? MediaQuery.of(context).size.width - 342.w
                : ResponsiveWidget.isMediumScreen(context)
                ? MediaQuery.of(context).size.width - 160.w
                : MediaQuery.of(context).size.width,
            height: ResponsiveWidget.isSmallScreen(context) ? null : 140.h,
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Operating Days',
                              style: TextStyle(
                                color: AppColor.grayColor90,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                            horizontalSpace(14),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 10.h,
                              ),
                              decoration: ShapeDecoration(
                                color: AppColor.grayColor15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Text(
                                'Saturday to Thursday',
                                style: TextStyle(
                                  color: AppColor.grayColor90,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeightHelper.medium,
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColor.grayColor15,
                        thickness: 1,
                      ),
                      verticalSpace(40),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 10,
                          bottom: 10,
                        ),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: AppColor.grayColor15,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 20,
                          children: [
                            Text(
                              'Stay Connected',
                              style: TextStyle(
                                color: AppColor.grayColor90,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 70.w,
                                  height: 70.w,
                                  padding: EdgeInsets.all(20.w),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: svg.Svg(
                                        'assets/icons/facebook.svg',
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(0.00, 1.00),
                                      end: Alignment(0.00, 0.00),
                                      colors: [
                                        const Color(0xFF2E2E2E),
                                        const Color(0x002E2E2E),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: const Color(0xFF2E2E2E),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70.w,
                                  height: 70.w,
                                  padding: EdgeInsets.all(20.w),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: svg.Svg(
                                        'assets/icons/twitter.svg',
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(0.00, 1.00),
                                      end: Alignment(0.00, 0.00),
                                      colors: [
                                        const Color(0xFF2E2E2E),
                                        const Color(0x002E2E2E),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: const Color(0xFF2E2E2E),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70.w,
                                  height: 70.w,
                                  padding: EdgeInsets.all(20.w),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: svg.Svg(
                                        'assets/icons/linkedin.svg',
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(0.00, 1.00),
                                      end: Alignment(0.00, 0.00),
                                      colors: [
                                        const Color(0xFF2E2E2E),
                                        const Color(0x002E2E2E),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: const Color(0xFF2E2E2E),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(40),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Operating Days',
                        style: TextStyle(
                          color: AppColor.grayColor90,
                          fontSize: 16.sp,
                          fontWeight: FontWeightHelper.medium,
                          height: 1.50,
                        ),
                      ),
                      horizontalSpace(14),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColor.grayColor15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          'Saturday to Thursday',
                          style: TextStyle(
                            color: AppColor.grayColor90,
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.medium,
                            height: 1.50,
                          ),
                        ),
                      ),
                      horizontalSpace(40),
                      VerticalDivider(
                        color: AppColor.grayColor15,
                        thickness: 1,
                      ),
                      horizontalSpace(40),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 10,
                          bottom: 10,
                        ),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: AppColor.grayColor15,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 20,
                          children: [
                            Text(
                              'Stay Connected',
                              style: TextStyle(
                                color: AppColor.grayColor90,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: const EdgeInsets.all(20),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: svg.Svg(
                                        'assets/icons/facebook.svg',
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(0.00, 1.00),
                                      end: Alignment(0.00, 0.00),
                                      colors: [
                                        const Color(0xFF2E2E2E),
                                        const Color(0x002E2E2E),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: const Color(0xFF2E2E2E),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: const EdgeInsets.all(20),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: svg.Svg(
                                        'assets/icons/twitter.svg',
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(0.00, 1.00),
                                      end: Alignment(0.00, 0.00),
                                      colors: [
                                        const Color(0xFF2E2E2E),
                                        const Color(0x002E2E2E),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: const Color(0xFF2E2E2E),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: const EdgeInsets.all(20),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: svg.Svg(
                                        'assets/icons/linkedin.svg',
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(0.00, 1.00),
                                      end: Alignment(0.00, 0.00),
                                      colors: [
                                        const Color(0xFF2E2E2E),
                                        const Color(0x002E2E2E),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: const Color(0xFF2E2E2E),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          FAQPart(),
          CTASection(),
        ],
      ),
    );
  }
}
