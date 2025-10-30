import 'package:craftechy_website/core/constant/font_wight_helper.dart';
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
          width: MediaQuery.of(context).size.width - 160.w,
          height: 485.h,
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
                  'Thank you for your Interest in SquareUp.',
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
              verticalSpace(40),
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
