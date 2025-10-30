import 'package:flutter/material.dart';
import 'package:craftechy_website/feature/work/data/data.dart';
import 'package:craftechy_website/feature/work/ui/widget/work_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:craftechy_website/core/theme/color.dart';

class WorkPart extends StatelessWidget {
  const WorkPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 160.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double itemWidth = (constraints.maxWidth) / 2;
          return Wrap(
            children: List.generate(listOFWork.length, (index) {
              return SizedBox(
                width: itemWidth,
                child: WorkItem(index: index),
              );
            }),
          );
        },
      ),
    );
  }
}
