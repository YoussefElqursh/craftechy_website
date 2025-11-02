import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class OurServiceWidget extends StatelessWidget {
  final String header;
  final String description;
  final String image;

  const OurServiceWidget({
    super.key,
    required this.header,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)? Container(
      padding: EdgeInsets.all(40.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 80.h,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30.h,
              children: [
                Container(
                  width: 70.w,
                  height: 70.h,
                  padding: EdgeInsets.all(20.w),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    image: DecorationImage(image: svg.Svg(image)),
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
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 14,
                    children: [
                      SizedBox(
                        width: 346.67.w,
                        child: Text(
                          header,
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 24.sp,
                            fontWeight: FontWeightHelper.semiBold,
                            height: 1.50,
                            letterSpacing: -0.14,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 346.67.w,
                        child: Text(
                          description,
                          maxLines: 6,
                          style: TextStyle(
                            color: AppColor.grayColor90,
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.regular,
                            overflow: TextOverflow.ellipsis,
                            height: 1.50,
                            letterSpacing: -0.10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            minWidth: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            height: 60.h,
            elevation: 0.0,
            hoverElevation: 0.0,
            highlightElevation: 0.0,
            color: AppColor.grayColor15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              'Learn More',
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.medium,
                height: 1.71,
                letterSpacing: -0.08,
              ),
            ),
          ),
        ],
      ),
    ) : Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(40.w),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: AppColor.grayColor15,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 80.h,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30.h,
                children: [
                  Container(
                  width: 70.w,
                  height: 70.h,
                    padding: EdgeInsets.all(20.w),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      image: DecorationImage(image: svg.Svg(image)),
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
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 14,
                      children: [
                        SizedBox(
                          width: 346.67.w,
                          child: Text(
                            header,
                            style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: 24.sp,
                              fontWeight: FontWeightHelper.semiBold,
                              height: 1.50,
                              letterSpacing: -0.14,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 346.67.w,
                          child: Text(
                            description,
                            maxLines: 6,
                            style: TextStyle(
                              color: AppColor.grayColor90,
                              fontSize: 16.sp,
                              fontWeight: FontWeightHelper.regular,
                              overflow: TextOverflow.ellipsis,
                              height: 1.50,
                              letterSpacing: -0.10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              minWidth: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              height: 60.h,
              elevation: 0.0,
              hoverElevation: 0.0,
              highlightElevation: 0.0,
              color: AppColor.grayColor15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                'Learn More',
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.medium,
                  height: 1.71,
                  letterSpacing: -0.08,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
