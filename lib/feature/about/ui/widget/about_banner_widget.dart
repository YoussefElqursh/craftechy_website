import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:craftechy_website/core/theme/color.dart';

class AboutBanner extends StatelessWidget {
  const AboutBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 160.w,
      height: 280.h,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/About.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}