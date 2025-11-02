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
  final VoidCallback? onMenuTap;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const NavigationBarWidget({super.key, this.scaffoldKey, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.path;
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isLargeScreen(context)
            ? 162.w
            : ResponsiveWidget.isMediumScreen(context)
            ? 80.w
            : 16.w,
        vertical: ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isMediumScreen(context)
            ? 20.h
            : 10.h,
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

          // 🧭 Navigation for medium and large screens
          if (!isSmall)
            Row(
              spacing: 24.w,
              children: [
                buildNavButton(context, 'Home', Routes.homeRoute, currentRoute),
                buildNavButton(context, 'Services', Routes.servicesRoute, currentRoute),
                buildNavButton(context, 'Work', Routes.workRoute, currentRoute),
                buildNavButton(context, 'Process', Routes.processRoute, currentRoute),
                buildNavButton(context, 'About', Routes.aboutRoute, currentRoute),
                buildNavButton(context, 'Careers', Routes.careersRoute, currentRoute),
              ],
            ),

          if (!isSmall) const Spacer(),

          // 📞 Contact Button (large/medium only)
          if (!isSmall)
            CommonBtnWidget(
              title: 'Contact Us',
              onPressed: () => context.go(Routes.contactRoute),
              borderSide: BorderSide.none,
            ),

          // 🍔 Menu icon for small screens
          if (isSmall)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                onMenuTap!();
              },
            ),
        ],
      ),
    );
  }
}
