import 'package:craftechy_website/feature/services/ui/widget/get_in_touch_widget.dart';
import 'package:craftechy_website/feature/work/ui/widget/header_section.dart';
import 'package:craftechy_website/feature/work/ui/widget/our_work_banner.dart';
import 'package:craftechy_website/feature/work/ui/widget/work_part_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OurWorkBanner(),
          HeaderSection(),
          WorkPart(),
          GetInTouchWidget(),
        ],
      ),
    );
  }
}