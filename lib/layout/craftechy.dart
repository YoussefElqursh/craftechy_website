import 'package:craftechy_website/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:craftechy_website/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Craftechy extends StatelessWidget {
  const Craftechy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 950),
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
