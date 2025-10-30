import 'package:craftechy_website/feature/services/ui/widget/service_specis.dart';
import 'package:flutter/material.dart';

import 'service_header_widget.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final String description;
  final String subtitle;
  final List<Map<String, String>> listOfServices1;
  final List<Map<String, String>> listOfServices2;
  final List<Map<String, String>> listOfServices3;

  const ServiceItem({
    super.key,
    required this.title,
    required this.description,
    required this.subtitle,
    required this.listOfServices1,
    required this.listOfServices2,
    required this.listOfServices3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ServiceHeader(
          title: title,
          description: description,
          subtitle: subtitle,
        ),
        ServiceSpecis(listOfServices: listOfServices1),
        ServiceSpecis(listOfServices: listOfServices2),
        ServiceSpecis(listOfServices: listOfServices3),
      ],
    );
  }
}
