import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart'as svg;

class IconContainerWidget extends StatelessWidget {
  const IconContainerWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.h,
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        image: DecorationImage(image: svg.Svg(image)),
        gradient: LinearGradient(
          begin: Alignment(0.00, 1.00),
          end: Alignment(0.00, 0.00),
          colors: [
            const Color(0xFF2E2E2E),
            const Color(0x002E2E2E),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFF2E2E2E),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
