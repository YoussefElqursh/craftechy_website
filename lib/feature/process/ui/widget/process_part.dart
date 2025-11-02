import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/process/data/data.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProcessPart extends StatelessWidget {
  const ProcessPart({
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
          double itemWidth = ResponsiveWidget.isSmallScreen(context)? (constraints.maxWidth) : (constraints.maxWidth) / 2;
          return Wrap(
            children: List.generate(processList.length, (index) {
              return SizedBox(
                width: itemWidth,
                child: ProcessItemWidget(index: index, processList: processList,),
              );
            }),
          );
        },
      ),
    );
  }
}