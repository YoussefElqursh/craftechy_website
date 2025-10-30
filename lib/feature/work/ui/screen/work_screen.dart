import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:craftechy_website/feature/work/ui/widget/header_section.dart';
import 'package:craftechy_website/feature/work/ui/widget/our_work_banner.dart';
import 'package:craftechy_website/feature/work/ui/widget/work_part_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OurWorkBanner(),
          HeaderSection(),
          WorkPart(),
          Container(
            width: MediaQuery.of(context).size.width - 160.w,
            height: 625.h,
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
                  image: svg.Svg('assets/icons/Logo.svg'),
                  width: 60.w,
                  height: 60.h,
                ),
                verticalSpace(40),
                SizedBox(
                  width: 780,
                  child: Text(
                    'Let us Bring your Ideas to Life in the Digital World.',
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
                  width: 780,
                  child: Text(
                    'No matter which services you choose, we are committed to delivering exceptional results that exceed your expectations. Our multidisciplinary team works closely together to ensure seamless collaboration and a unified vision for your digital product.',
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
                verticalSpace(40),
                CommonBtnWidget(
                  title: 'Start Project',
                  borderSide: BorderSide.none,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}