import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width - 342.w
          : ResponsiveWidget.isMediumScreen(context)
          ? MediaQuery.of(context).size.width - 160.w
          : MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 60.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Image(
                    image: svg.Svg('assets/icons/Logo.svg'),
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.contain,
                  ),
                ),
                verticalSpace(24),
                Text(
                  'Today, SquareUp Continues to Thrive as a Leading Digital Product Agency.....',
                  style: TextStyle(
                    color: AppColor.grayColor60,
                    fontSize: 24.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                verticalSpace(10),
                Text(
                  'Combining the power of design, engineering, and project management to create transformative digital experiences. They invite you to join them on their journey and discover how they can help bring your digital ideas to life.',
                  style: TextStyle(
                    color: AppColor.grayColor60,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.regular,
                    height: 1.50,
                  ),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(30),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: AppColor.grayColor25,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: AppColor.grayColor15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 14,
                          children: [
                            SizedBox(
                              width: 270.w,
                              child: Text(
                                'Welcome to SquareUp',
                                style: TextStyle(
                                  color: AppColor.grayColor60,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeightHelper.regular,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: ShapeDecoration(
                                color: AppColor.grayColor15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: SizedBox(
                                width: 242.w,
                                child: Text(
                                  'Where collaboration, Expertise, and Client-Centricity Intersect to Shape the Future of Digital Innovation.',
                                  style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeightHelper.regular,
                                    height: 1.50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CommonBtnWidget(
                        title: 'Start Project',
                        onPressed: () {},
                        borderSide: BorderSide.none,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 40,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 30,
                  children: [
                    Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Image(
                        image: svg.Svg('assets/icons/Logo.svg'),
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text(
                            'Today, SquareUp Continues to Thrive as a Leading Digital Product Agency.....',
                            style: TextStyle(
                              color: AppColor.grayColor60,
                              fontSize: 24.sp,
                              fontWeight: FontWeightHelper.medium,
                            ),
                          ),
                          Text(
                            'Combining the power of design, engineering, and project management to create transformative digital experiences. They invite you to join them on their journey and discover how they can help bring your digital ideas to life.',
                            style: TextStyle(
                              color: AppColor.grayColor60,
                              fontSize: 16.sp,
                              fontWeight: FontWeightHelper.regular,
                              height: 1.50,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 20.h,
                  ),
                  decoration: ShapeDecoration(
                    color: AppColor.grayColor25,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                          color: AppColor.grayColor15,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              'Welcome to SquareUp',
                              style: TextStyle(
                                color: AppColor.grayColor60,
                                fontSize: 18.sp,
                                fontWeight: FontWeightHelper.regular,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              decoration: ShapeDecoration(
                                color: AppColor.grayColor15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Text(
                                'Where collaboration, Expertise, and Client-Centricity Intersect to Shape the Future of Digital Innovation.',
                                style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeightHelper.regular,
                                  height: 1.50,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CommonBtnWidget(
                        title: 'Start Project',
                        onPressed: () {},
                        borderSide: BorderSide.none,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
