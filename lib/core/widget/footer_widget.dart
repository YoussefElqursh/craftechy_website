import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/routing/routes.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/footer_bar_btn_widget.dart';
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
            ? 162.w
            : ResponsiveWidget.isMediumScreen(context)
            ? 80.w
            : 16.w,
        vertical:
            ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context)
            ? 20.h
            : 30.h,
      ),
      child: ResponsiveWidget.isSmallScreen(context)?
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icon/Logo.svg',
              height: 50.h,
              width: 50.w,
            ),
            horizontalSpace(7),
            SvgPicture.asset('assets/icon/SquareUp.svg'),
          ],
        ),
          verticalSpace(30),
          Divider(
            color: AppColor.grayColor15,
            thickness: 1,
          ),
          verticalSpace(30),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              FooterBarBtnWidget(
                title: 'Home',
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  context.go(Routes.homeRoute);
                },
                isSelected: isSelected,
              ),
              FooterBarBtnWidget(
                title: 'Services',
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  context.go(Routes.servicesRoute);
                },
                isSelected: isSelected,
              ),
              FooterBarBtnWidget(
                title: 'Work',
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  context.go(Routes.workRoute);
                },
                isSelected: isSelected,
              ),
              FooterBarBtnWidget(
                title: 'Process',
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  context.go(Routes.processRoute);
                },
                isSelected: isSelected,
              ),
              FooterBarBtnWidget(
                title: 'About',
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  context.go(Routes.aboutRoute);
                },
                isSelected: isSelected,
              ),
              FooterBarBtnWidget(
                title: 'Careers',
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  context.go(Routes.careersRoute);
                },
                isSelected: isSelected,
              ),
              FooterBarBtnWidget(
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
          verticalSpace(30),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 10.h,
              left: 20.w,
              right: 10.w,
              bottom: 10.h,
            ),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.w, color: AppColor.grayColor15),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20.w,
              children: [
                Text(
                  'Stay Connected',
                  style: TextStyle(
                    color: AppColor.grayColor90,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    height: 1.5,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10.w,
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
                      padding: EdgeInsets.all(20.w),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: svg.Svg('assets/icon/facebook.svg'),
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
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    Container(
                      width: 70.w,
                      height: 70.h,
                      padding: EdgeInsets.all(20.w),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: svg.Svg('assets/icon/twitter.svg'),
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
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    Container(
                      width: 70.w,
                      height: 70.h,
                      padding: EdgeInsets.all(20.w),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: svg.Svg('assets/icon/linkedin.svg'),
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
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icon/email.svg'),
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
          ),
          Divider(
            color: AppColor.grayColor15,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icon/phone.svg'),
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
          ),
          Divider(
            color: AppColor.grayColor15,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icon/location.svg'),
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
          ),
          Divider(
            color: AppColor.grayColor15,
            thickness: 1,
          ),
          verticalSpace(20),
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
      )
      :
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 40.w,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            direction: Axis.horizontal,
            spacing: 24.w,
            runSpacing: 24.h,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icon/Logo.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                  horizontalSpace(7),
                  SvgPicture.asset('assets/icon/SquareUp.svg'),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 24.0.w,
                children: [
                  FooterBarBtnWidget(
                    title: 'Home',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.homeRoute);
                    },
                    isSelected: isSelected,
                  ),
                  FooterBarBtnWidget(
                    title: 'Services',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.servicesRoute);
                    },
                    isSelected: isSelected,
                  ),
                  FooterBarBtnWidget(
                    title: 'Work',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.workRoute);
                    },
                    isSelected: isSelected,
                  ),
                  FooterBarBtnWidget(
                    title: 'Process',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.processRoute);
                    },
                    isSelected: isSelected,
                  ),
                  FooterBarBtnWidget(
                    title: 'About',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.aboutRoute);
                    },
                    isSelected: isSelected,
                  ),
                  FooterBarBtnWidget(
                    title: 'Careers',
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      context.go(Routes.careersRoute);
                    },
                    isSelected: isSelected,
                  ),
                  FooterBarBtnWidget(
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
              Container(
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 20.w,
                  right: 10.w,
                  bottom: 10.h,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: AppColor.grayColor15),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20.w,
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
                      spacing: 10.w,
                      children: [
                        Container(
                          width: 70.w,
                          height: 70.h,
                          padding: EdgeInsets.all(20.w),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: svg.Svg('assets/icon/facebook.svg'),
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
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        Container(
                          width: 70.w,
                          height: 70.h,
                          padding: EdgeInsets.all(20.w),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: svg.Svg('assets/icon/twitter.svg'),
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
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        Container(
                          width: 70.w,
                          height: 70.h,
                          padding: EdgeInsets.all(20.w),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: svg.Svg('assets/icon/linkedin.svg'),
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
                              borderRadius: BorderRadius.circular(8.r),
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
                  SvgPicture.asset('assets/icon/email.svg'),
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
                  SvgPicture.asset('assets/icon/phone.svg'),
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
                  SvgPicture.asset('assets/icon/location.svg'),
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
