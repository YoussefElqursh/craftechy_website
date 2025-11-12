import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/icon_container_widget.dart';
import 'package:craftechy_website/feature/careers/data/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobItem extends StatelessWidget {
  final JobModel job;
  const JobItem({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              IconContainerWidget(image: job.iconPath),
              SizedBox(
                width: 346.67,
                child: Text(
                  job.jobTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                    letterSpacing: -0.12,
                  ),
                ),
              ),
              SizedBox(
                width: 346.67,
                child: Text(
                  job.jobDescription,
                  style: TextStyle(
                    color: const Color(0xFFE6E6E6),
                    fontSize: 16,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                    letterSpacing: -0.10,
                  ),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.go('/careers/job', extra: job);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: ShapeDecoration(
                color: const Color(0xFF262626),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'Apply Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w500,
                      height: 1.71,
                      letterSpacing: -0.08,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
