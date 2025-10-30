import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/about/data/data.dart';
import 'package:craftechy_website/feature/about/ui/widget/about_banner_widget.dart';
import 'package:craftechy_website/feature/about/ui/widget/cta_section_widget.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_item_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AboutBanner(),
          Container(
            width: MediaQuery.of(context).size.width - 160.w,
            padding: EdgeInsets.symmetric(
              horizontal: 100.w,
              vertical: 80.h,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColor.grayColor15,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 290,
                      child: Text(
                        'About SquareUp',
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 38.sp,
                          fontWeight: FontWeightHelper.semiBold,
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    SizedBox(
                      width: 290,
                      child: Text(
                        'SquareUp is a digital product agency that is passionate about crafting exceptional digital experiences. We specialize in design, engineering, and project management, helping businesses thrive in the digital landscape. At SquareUp, we follow a structured and collaborative process to ensure the successful delivery of exceptional digital products. Our process combines industry best practices, creative thinking, and a client-centric approach.',
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
                      image: svg.Svg('assets/icons/Logo.svg'),
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 160.w,
            padding: EdgeInsets.symmetric(
              horizontal: 100.w,
              vertical: 80.h,
            ),
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
          ),
          Container(
            width: MediaQuery.of(context).size.width - 160.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColor.grayColor15,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double itemWidth = (constraints.maxWidth) / 2;
                return Wrap(
                  children: List.generate(aboutList.length, (index) {
                    return SizedBox(
                      width: itemWidth,
                      child: ProcessItemWidget(
                        index: index,
                        processList: aboutList,
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          CTASection(),
        ],
      ),
    );
  }
}
