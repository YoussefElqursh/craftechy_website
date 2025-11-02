import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/icon_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceSpecisItem extends StatelessWidget {
  final String image;
  final String description;

  const ServiceSpecisItem({
    super.key,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)? (MediaQuery.sizeOf(context).width - 342.w)/4 : ResponsiveWidget.isMediumScreen(context)? (MediaQuery.sizeOf(context).width - 160.w)/4 : double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.w, horizontal: 40.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconContainerWidget(image: image),
          verticalSpace(25),
          SizedBox(
            width: 240.w,
            height: 60.h,
            child: Text(
              description,
              style: TextStyle(
                color: AppColor.grayColor90,
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                height: 1.50,
                letterSpacing: -0.10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
