import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProcessItemWidget extends StatelessWidget {
  final int index;
  final List processList;

  const ProcessItemWidget({
    super.key,
    required this.index,
    required this.processList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 40,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 14,
              children: [
                Text(
                  '0${index + 1}',
                  style: TextStyle(
                    color: AppColor.greenColor80,
                    fontSize: 120.sp,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 20),
                    decoration: ShapeDecoration(
                      shape: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColor.grayColor15,
                        ),
                      ),
                    ),
                    child: Text(
                      processList[index]['title']!,
                      style: TextStyle(
                        color: AppColor.grayColor60,
                        fontSize: 24.sp,
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 560.w,
            height: 120.h,
            child: Text(
              processList[index]['description']!,
              style: TextStyle(
                color: AppColor.grayColor60,
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
                height: 1.50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
