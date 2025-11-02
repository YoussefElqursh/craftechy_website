import 'package:craftechy_website/feature/about/ui/widget/cta_section_widget.dart';
import 'package:craftechy_website/feature/contact/ui/widget/contact_methods.dart';
import 'package:craftechy_website/feature/contact/ui/widget/contact_us_banner_widget.dart';
import 'package:craftechy_website/feature/contact/ui/widget/social_media_contact.dart';
import 'package:craftechy_website/feature/home/ui/widget/faq_part/faq_part.dart';
import 'package:craftechy_website/feature/process/ui/widget/get_touch_form_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ContactUsBannerWidget(),
          ContactMethods(),
          GetTouchFormWidget(),
          SocialMediaContact(),
          FAQPart(),
          CTASection(),
        ],
      ),
    );
  }
}
