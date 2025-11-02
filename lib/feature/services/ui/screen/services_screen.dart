import 'package:craftechy_website/feature/home/ui/widget/our_services_part/our_services_banner.dart';
import 'package:craftechy_website/feature/services/data/data.dart';
import 'package:craftechy_website/feature/services/ui/widget/get_in_touch_widget.dart';
import 'package:craftechy_website/feature/services/ui/widget/service_item.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OurServicesBanner(),
          ServiceItem(
            title: 'Design',
            description:
            'At Craftechy, our design team is passionate about creating stunning, user-centric designs that captivate your audience and elevate your brand. We believe that great design is not just about aesthetics; it\'s about creating seamless and intuitive user experiences. ',
            subtitle: 'Our design services include:',
            listOfServices1: uxListOfServices,
            listOfServices2: uiListOfServices,
            listOfServices3: diListOfServices,
          ),
          ServiceItem(
            title: 'Engineering',
            description:
            'Our engineering team combines technical expertise with a passion for innovation to build robust and scalable digital solutions. We leverage the latest technologies and best practices to deliver high-performance applications tailored to your specific needs.',
            subtitle: 'Our engineering services include:',
            listOfServices1: webListOfServices,
            listOfServices2: mobileListOfServices,
            listOfServices3: customListOfServices,
          ),
          ServiceItem(
            title: 'Project Management',
            description:'Our experienced project management team ensures that your projects are delivered on time, within budget, and according to your specifications. We follow industry-standard methodologies and employ effective communication and collaboration tools to keep you informed throughout the development process.',
            subtitle: 'Our project management services include:',
            listOfServices1: ppListOfServices,
            listOfServices2: adListOfServices,
            listOfServices3: qtListOfServices,
          ),
          GetInTouchWidget(),
        ],
      ),
    );
  }
}




