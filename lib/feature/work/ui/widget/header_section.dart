import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 160.w,
      padding: EdgeInsets.symmetric(
        vertical: 80.w,
        horizontal: 40.w,
      ).copyWith(bottom: 40.w),
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
          SizedBox(
            width: 950.sp,
            child: Text(
              'At SquareUp',
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 38.sp,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          ),
          verticalSpace(10),
          SizedBox(
            width: 950.sp,
            child: Text(
              'We have had the privilege of working with a diverse range of clients and delivering exceptional digital products that drive success.',
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: AppColor.grayColor15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              'Here are ten examples of our notable works:',
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}