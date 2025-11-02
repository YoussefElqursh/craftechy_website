import 'package:craftechy_website/core/widget/footer_bar_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget buildNavButton(BuildContext context, String title, String route, String currentRoute) {
  return FooterBarBtnWidget(
    title: title,
    isSelected: currentRoute == route,
    onPressed: () {
      if (currentRoute != route) context.go(route);
    },
  );
}