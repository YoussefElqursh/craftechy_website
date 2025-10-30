import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/widget/footer_widget.dart';
import 'package:craftechy_website/core/widget/navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        // 🖥️ Large screen layout (desktop)
        largeScreen: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavigationBarWidget(),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) =>
                    Column(children: [child, FooterWidget()]),
              ),
            ),
          ],
        ),

        // 💻 Medium screen layout (tablet)
        mediumScreen: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavigationBarWidget(),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) =>
                    Column(children: [child, FooterWidget()]),
              ),
            ),
          ],
        ),

        // 📱 Small screen layout (mobile)
        smallScreen: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavigationBarWidget(),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) =>
                    Column(children: [child, FooterWidget()]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
