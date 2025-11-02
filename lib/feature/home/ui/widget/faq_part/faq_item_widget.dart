import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final int index;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
    this.isExpanded = false,
    required this.index,
  });

  @override
  FAQItemState createState() => FAQItemState();
}

class FAQItemState extends State<FAQItem> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: AppColor.grayColor10,
      elevation: 0.0,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: _isExpanded ? AppColor.greenColor50 : AppColor.grayColor15,
          width: _isExpanded ? 2 : 0,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            width: ResponsiveWidget.isLargeScreen(context)? 88.w : ResponsiveWidget.isMediumScreen(context)? 70.w : 58.w,
            height: ResponsiveWidget.isLargeScreen(context)? 88.h : ResponsiveWidget.isMediumScreen(context)? 70.h : 58.h,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, 1.00),
                end: Alignment(0.00, 0.00),
                colors: [const Color(0xFF242424), const Color(0x00242424)],
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0xFF2E2E2E)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              '0${widget.index + 1}',
              style: TextStyle(
                color: _isExpanded
                    ? AppColor.greenColor50
                    : AppColor.whiteColor,
                fontSize: 24.sp,
                fontWeight: FontWeightHelper.semiBold,
                height: 1.50,
              ),
            ),
          ),
          tilePadding: EdgeInsets.all(24.w),
          iconColor: AppColor.greenColor70,
          title: Text(
            widget.question,
            style: TextStyle(
              color: _isExpanded ? AppColor.greenColor65 : AppColor.whiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.medium,
              height: 1.44,
            ),
          ),
          collapsedIconColor: AppColor.greenColor70,
          initiallyExpanded: widget.isExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 24,
                right: 24,
                bottom: 24,
              ),
              child: Text(
                widget.answer,
                style: TextStyle(
                  color: AppColor.grayColor90,
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.regular,
                  height: 1.50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
