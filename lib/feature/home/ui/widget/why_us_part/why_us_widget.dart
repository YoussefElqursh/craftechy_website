import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class WhyUsWidget extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  const WhyUsWidget({super.key, required this.title, required this.description, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColor.grayColor15,
            ),
          ),
          padding: const EdgeInsets.all(60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 14,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(20),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      image: DecorationImage(image: svg.Svg(icon,),),
                      gradient: LinearGradient(
                        begin: Alignment(0.00, 1.00),
                        end: Alignment(0.00, 0.00),
                        colors: [const Color(0xFF242424), const Color(0x00242424)],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFF2E2E2E),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400.w,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeightHelper.medium,
                        height: 1.50,
                        letterSpacing: -0.12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 500.w,
                child: Text(
                  description,
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.regular,
                    height: 1.50,
                    letterSpacing: -0.10,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
