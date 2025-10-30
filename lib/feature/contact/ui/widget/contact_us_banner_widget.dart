import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsBannerWidget extends StatelessWidget {
  const ContactUsBannerWidget({super.key});

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
          image: AssetImage('assets/images/contact.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}