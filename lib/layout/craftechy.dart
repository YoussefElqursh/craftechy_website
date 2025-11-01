import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:craftechy_website/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Craftechy extends StatelessWidget {
  const Craftechy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ResponsiveWidget.isLargeScreen(context) ? const Size(1920, 1000) : ResponsiveWidget.isMediumScreen(context) ? const Size(1440, 950) : const Size(390, 950),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Craftechy',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
