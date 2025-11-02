import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/home/data/q_a.dart';
import 'package:craftechy_website/feature/home/ui/widget/faq_part/faq_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAQPart extends StatelessWidget {
  const FAQPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
          height: 280.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/faq.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColor.grayColor15,
            ),
          ),
        ),
        Container(
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
              double itemWidth = ResponsiveWidget.isSmallScreen (context) ? (constraints.maxWidth) : (constraints.maxWidth) / 2;
              return Wrap(
                children: List.generate(listOFFAQ.length, (index) {
                  return SizedBox(
                    width: itemWidth,
                    child: FAQItem(
                      index: index,
                      question: listOFFAQ[index]['question']!,
                      answer: listOFFAQ[index]['answer']!,
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}