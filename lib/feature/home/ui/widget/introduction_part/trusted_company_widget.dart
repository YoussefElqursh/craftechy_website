import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class TrustedCompanyWidget extends StatelessWidget {
  final String image;

  const TrustedCompanyWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(image: svg.Svg(image)),
        ),
      ),
    );
  }
}
