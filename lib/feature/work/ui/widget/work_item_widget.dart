import 'package:cached_network_image/cached_network_image.dart';
import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/work/data/model/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkItem extends StatelessWidget {
  final ProjectModel project;

  const WorkItem({super.key, required this.project});

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
              project.projectHeader,
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
                  width: double.infinity,
                  height: 223.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    imageUrl: project.projectImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                            project.projectTitle,
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
                            project.projectLink,
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
                    project.projectDescription,
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