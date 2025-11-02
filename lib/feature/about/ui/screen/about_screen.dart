import 'package:craftechy_website/feature/about/ui/widget/about_banner_widget.dart';
import 'package:craftechy_website/feature/about/ui/widget/about_header.dart';
import 'package:craftechy_website/feature/about/ui/widget/about_part.dart';
import 'package:craftechy_website/feature/about/ui/widget/cta_section_widget.dart';
import 'package:craftechy_website/feature/about/ui/widget/our_story_header.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AboutBanner(),
          AboutHeader(),
          OurStoryHeader(),
          AboutPart(),
          CTASection(),
        ],
      ),
    );
  }
}