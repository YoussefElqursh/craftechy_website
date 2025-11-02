import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/careers/data/data.dart';
import 'package:craftechy_website/feature/careers/ui/widget/careers_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareersPart extends StatelessWidget {
  const CareersPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double itemWidth = ResponsiveWidget. isSmallScreen(context)? (constraints.maxWidth) : (constraints.maxWidth) / 2;
          return Wrap(
            children: List.generate(listOFCareers.length, (index) {
              return SizedBox(
                width: itemWidth,
                child: CareersItem(index: index),
              );
            }),
          );
        },
      ),
    );
  }
}