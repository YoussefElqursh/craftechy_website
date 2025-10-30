import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationBarBtnWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final bool isSelected;

  const NavigationBarBtnWidget({
    super.key,
    this.onPressed,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6.r),
          ),
        ),
        backgroundColor: isSelected
            ? WidgetStatePropertyAll(AppColor.grayColor15)
            : WidgetStatePropertyAll(Colors.transparent),
        overlayColor: isSelected
            ? WidgetStatePropertyAll(AppColor.grayColor15)
            : WidgetStatePropertyAll(Colors.transparent),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColor.whiteColor : AppColor.grayColor90,
          fontSize: 14.sp,
          fontWeight: isSelected
              ? FontWeightHelper.semiBold
              : FontWeightHelper.medium,
          height: 1.50,
        ),
      ),
    );
  }
}
