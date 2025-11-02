import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactMethods extends StatelessWidget {
  const ContactMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width - 342.w
          : ResponsiveWidget.isMediumScreen(context)
          ? MediaQuery.of(context).size.width - 160.w
          : MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            decoration: ShapeDecoration(
              color: AppColor.grayColor15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 14,
              children: [
                SvgPicture.asset('assets/icons/email.svg'),
                SelectableText(
                  'Craftechy.com',
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            decoration: ShapeDecoration(
              color: AppColor.grayColor15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 14,
              children: [
                SvgPicture.asset('assets/icons/phone.svg'),
                SelectableText(
                  '+91 91813 23 2309',
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            decoration: ShapeDecoration(
              color: AppColor.grayColor15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 14,
              children: [
                SvgPicture.asset('assets/icons/location.svg'),
                SelectableText(
                  'Get Location',
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
          : Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            decoration: ShapeDecoration(
              color: AppColor.grayColor15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 14,
              children: [
                SvgPicture.asset('assets/icons/email.svg'),
                SelectableText(
                  'Craftechy.com',
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            decoration: ShapeDecoration(
              color: AppColor.grayColor15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 14,
              children: [
                SvgPicture.asset('assets/icons/phone.svg'),
                SelectableText(
                  '+91 91813 23 2309',
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            decoration: ShapeDecoration(
              color: AppColor.grayColor15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 14,
              children: [
                SvgPicture.asset('assets/icons/location.svg'),
                SelectableText(
                  'Get Location',
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}