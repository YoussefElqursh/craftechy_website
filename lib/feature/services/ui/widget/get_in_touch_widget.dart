import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class GetInTouchWidget extends StatelessWidget {
  const GetInTouchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
      height: 510.h,
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
    );
  }
}