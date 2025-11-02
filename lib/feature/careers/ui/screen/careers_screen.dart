import 'package:craftechy_website/feature/about/ui/widget/cta_section_widget.dart';
import 'package:craftechy_website/feature/careers/ui/widget/career_banner_widget.dart';
import 'package:craftechy_website/feature/careers/ui/widget/careers_part.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_header_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';

class CareersScreen extends StatelessWidget {
  const CareersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CareerBannerWidget(),
          ProcessHeaderWidget(
            title: 'Welcome to Craftechy, where talent meets opportunity!',
            description:
            'At Craftechy, we believe that the success of our agency lies in the talent, passion, and dedication of our team members. We are a digital product agency that thrives on innovation, creativity, and collaboration. If you\'re ready to make a difference and contribute to cutting-edge projects, we invite you to explore career opportunities with us.',
            subtitle: 'Why Work at Craftechy?',
          ),
          CareersPart(),
          CTASection(),
        ],
      ),
    );
  }
}