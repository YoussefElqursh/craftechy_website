import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/work/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkItem extends StatelessWidget {
  final int index;

  const WorkItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColor.grayColor15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            decoration: ShapeDecoration(
              shape: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColor.grayColor15),
              ),
            ),
            child: Text(
              listOFWork[index]['header']!,
              style: TextStyle(
                color: AppColor.grayColor60,
                fontSize: 26.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
            ).copyWith(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 30,
              children: [
                Container(
                  height: 223.h,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(listOFWork[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        SizedBox(
                          width: 198.75,
                          child: Text(
                            listOFWork[index]['title']!,
                            style: TextStyle(
                              color: const Color(0xFFE6E6E6),
                              fontSize: 24.sp,
                              fontWeight: FontWeightHelper.medium,
                              height: 1.50,
                              letterSpacing: -0.14,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: AppColor.grayColor15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            listOFWork[index]['link']!,
                            style: TextStyle(
                              color: AppColor.grayColor60,
                              fontSize: 18.sp,
                              fontWeight: FontWeightHelper.regular,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: AppColor.grayColor15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Icon(
                        Icons.north_east_sharp,
                        color: AppColor.greenColor50,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: Text(
                    listOFWork[index]['description']!,
                    style: TextStyle(
                      color: AppColor.grayColor60,
                      fontSize: 18.sp,
                      fontWeight: FontWeightHelper.regular,
                      height: 1.50,
                    ),
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