import 'package:craftechy_website/feature/home/ui/widget/faq_part/faq_part.dart';
import 'package:craftechy_website/feature/home/ui/widget/get_in_touch_part.dart';
import 'package:craftechy_website/feature/home/ui/widget/introduction_part/introductoin_part.dart';
import 'package:craftechy_website/feature/home/ui/widget/our_services_part/our_services_part.dart';
import 'package:craftechy_website/feature/home/ui/widget/why_us_part/why_us_part.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IntroductionPart(),
          OurServicePart(),
          WhyUsPart(),
          FAQPart(),
          GetInTouchPart(),
        ],
      ),
    );
  }
}