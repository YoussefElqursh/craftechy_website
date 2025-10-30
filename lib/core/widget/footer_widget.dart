import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/routing/routes.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/navigation_bar_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:go_router/go_router.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColor.grayColor15),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isLargeScreen(context)
            ? 162
            : ResponsiveWidget.isMediumScreen(context)
            ? 80
            : 16,
        vertical:
            ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context)
            ? 20
            : 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 40,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/Logo.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                  horizontalSpace(7),
                  SvgPicture.asset('assets/icons/SquareUp.svg'),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 24.w,
                children: [
                  NavigationBarBtnWidget(
                    title: 'Home',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.homeRoute);
                    },
                    isSelected: isSelected,
                  ),
                  NavigationBarBtnWidget(
                    title: 'Services',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.servicesRoute);
                    },
                    isSelected: isSelected,
                  ),
                  NavigationBarBtnWidget(
                    title: 'Work',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.workRoute);
                    },
                    isSelected: isSelected,
                  ),
                  NavigationBarBtnWidget(
                    title: 'Process',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.processRoute);
                    },
                    isSelected: isSelected,
                  ),
                  NavigationBarBtnWidget(
                    title: 'About',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.aboutRoute);
                    },
                    isSelected: isSelected,
                  ),
                  NavigationBarBtnWidget(
                    title: 'Careers',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.careersRoute);
                    },
                    isSelected: isSelected,
                  ),
                  NavigationBarBtnWidget(
                    title: 'Contact',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.contactRoute);
                    },
                    isSelected: isSelected,
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 10,
                  bottom: 10,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: AppColor.grayColor15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text(
                      'Stay Connected',
                      style: TextStyle(
                        color: AppColor.grayColor90,
                        fontSize: 16.sp,
                        fontWeight: FontWeightHelper.medium,
                        height: 1.50,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(20),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: svg.Svg('assets/icons/facebook.svg'),
                            ),
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(20),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: svg.Svg('assets/icons/twitter.svg'),
                            ),
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(20),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: svg.Svg('assets/icons/linkedin.svg'),
                            ),
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: AppColor.grayColor15, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/email.svg'),
                  horizontalSpace(10),
                  SelectableText(
                    'info@craftechy.com',
                    style: TextStyle(
                      color: AppColor.grayColor90,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.medium,
                      height: 1.50,
                    ),
                  ),
                ],
              ),
              horizontalSpace(22),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/phone.svg'),
                  horizontalSpace(10),
                  SelectableText(
                    '+1 234 567 890',
                    style: TextStyle(
                      color: AppColor.grayColor90,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.medium,
                      height: 1.50,
                    ),
                  ),
                ],
              ),
              horizontalSpace(22),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/location.svg'),
                  horizontalSpace(10),
                  SelectableText(
                    '123 Main St, Anytown, USA',
                    style: TextStyle(
                      color: AppColor.grayColor90,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.medium,
                      height: 1.50,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '© 2025 Craftechy. All rights reserved.',
                style: TextStyle(
                  color: AppColor.grayColor60,
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  height: 1.50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
