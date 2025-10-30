import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';

class CTASection extends StatelessWidget {
  const CTASection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 160.w,
      padding: EdgeInsets.symmetric(
        horizontal: 60.w,
        vertical: 60.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: Column(
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
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            decoration: ShapeDecoration(
              color: const Color(0x33242424),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: const Color(0xFF262626),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Expanded(
                  flex:1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    spacing: 14,
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColor.grayColor15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              6,
                            ),
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