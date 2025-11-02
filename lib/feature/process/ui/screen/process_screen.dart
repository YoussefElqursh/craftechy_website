import 'package:craftechy_website/feature/home/ui/widget/get_in_touch_part.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_banner_widget.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_header_widget.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_part.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProcessBannerWidget(),
          ProcessHeaderWidget(
            title: 'At Craftechy',
            description:
            'We follow a structured and collaborative process to ensure the successful delivery of exceptional digital products. Our process combines industry best practices, creative thinking, and a client-centric approach.',
            subtitle: 'Here\'s an overview of our typical process:',
          ),
          ProcessPart(),
          GetInTouchPart(),
        ],
      ),
    );
  }
}
