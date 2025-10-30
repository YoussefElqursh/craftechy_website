import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/home/ui/widget/get_in_touch_part.dart';
import 'package:craftechy_website/feature/process/data/data.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_banner_widget.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_header_widget.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_item_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProcessBannerWidget(),
          ProcessHeaderWidget(
            title: 'At SquareUp',
            description:
            'We follow a structured and collaborative process to ensure the successful delivery of exceptional digital products. Our process combines industry best practices, creative thinking, and a client-centric approach.',
            subtitle: 'Here\'s an overview of our typical process:',
          ),
          Container(
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
                  children: List.generate(processList.length, (index) {
                    return SizedBox(
                      width: itemWidth,
                      child: ProcessItemWidget(index: index, processList: processList,),
                    );
                  }),
                );
              },
            ),
          ),
          GetInTouchPart(),
        ],
      ),
    );
  }
}
