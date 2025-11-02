import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/routing/routes.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/footer_widget.dart';
import 'package:craftechy_website/core/widget/navigation_bar_btn_widget.dart';
import 'package:craftechy_website/core/widget/navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.path;
    return Scaffold(
      key: _scaffoldKey, // 🧠 Important
      endDrawer: Drawer(
        backgroundColor: AppColor.grayColor15,
        child: ListView(
          children: [
          buildNavButton(context, 'Home', Routes.homeRoute, currentRoute),
          buildNavButton(context, 'Services', Routes.servicesRoute, currentRoute),
          buildNavButton(context, 'Work', Routes.workRoute, currentRoute),
          buildNavButton(context, 'Process', Routes.processRoute, currentRoute),
          buildNavButton(context, 'About', Routes.aboutRoute, currentRoute),
          buildNavButton(context, 'Careers', Routes.careersRoute, currentRoute),
          ],
        ),
      ),
      body: SafeArea(
        child: ResponsiveWidget(
          largeScreen: _buildBody(context),
          mediumScreen: _buildBody(context),
          smallScreen: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NavigationBarWidget(
          onMenuTap: () {
            _scaffoldKey.currentState?.openEndDrawer(); // 👈 Open drawer
          },
        ),
        Expanded(
          flex: 1,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [child, const FooterWidget()],
          ),
        ),
      ],
    );
  }
}
