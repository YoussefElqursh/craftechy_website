import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/services/ui/widget/service_specis_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceSpecis extends StatelessWidget {
  final List<Map<String, String>> listOfServices;

  const ServiceSpecis({super.key, required this.listOfServices});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width - 342.w
          : ResponsiveWidget.isMediumScreen(context)
          ? MediaQuery.of(context).size.width - 160.w
          : MediaQuery.of(context).size.width,
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
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: SizedBox(
              width: ResponsiveWidget.isSmallScreen(context) ? 358.w : 1240.w,
              child: Text(
                listOfServices[0]['title']!,
                style: TextStyle(
                  color: AppColor.grayColor60,
                  fontSize: 22.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
          ),
          ResponsiveWidget.isSmallScreen(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    listOfServices.length,
                    (index) => ServiceSpecisItem(
                      image: listOfServices[index]['image']!,
                      description: listOfServices[index]['description']!,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    listOfServices.length,
                    (index) => ServiceSpecisItem(
                      image: listOfServices[index]['image']!,
                      description: listOfServices[index]['description']!,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
