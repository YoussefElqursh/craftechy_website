import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/routing/routes.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:craftechy_website/core/widget/navigation_bar_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.path;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isLargeScreen(context)
            ? 162
            : ResponsiveWidget.isMediumScreen(context)
            ? 80
            : 16,
        vertical: ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isMediumScreen(context)
            ? 20
            : 10,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColor.grayColor15,
          ),
        ),
      ),
      child: Row(
        children: [
          // Logo
          Row(
            children: [
              SvgPicture.asset('assets/icons/Logo.svg', height: 40.h, width: 40.w),
              horizontalSpace(7),
              SvgPicture.asset('assets/icons/SquareUp.svg'),
            ],
          ),

          const Spacer(),

          // Navigation buttons
          Row(
            spacing: 24.w,
            children: [
              _buildNavButton(context, 'Home', Routes.homeRoute, currentRoute),
              _buildNavButton(context, 'Services', Routes.servicesRoute, currentRoute),
              _buildNavButton(context, 'Work', Routes.workRoute, currentRoute),
              _buildNavButton(context, 'Process', Routes.processRoute, currentRoute),
              _buildNavButton(context, 'About', Routes.aboutRoute, currentRoute),
              _buildNavButton(context, 'Careers', Routes.careersRoute, currentRoute),
            ],
          ),

          const Spacer(),

          // Contact Button
          CommonBtnWidget(
            title: 'Contact Us',
            onPressed: () => context.go(Routes.contactRoute),
            borderSide: BorderSide.none,
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String title, String route, String currentRoute) {
    return NavigationBarBtnWidget(
      title: title,
      isSelected: currentRoute == route,
      onPressed: () {
        if (currentRoute != route) context.go(route);
      },
    );
  }
}
