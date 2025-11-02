import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class TrustedCompanyWidget extends StatelessWidget {
  final String image;

  const TrustedCompanyWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              image: DecorationImage(image: svg.Svg(image)),
            ),
          )
        : Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                image: DecorationImage(image: svg.Svg(image)),
              ),
            ),
          );
  }
}
