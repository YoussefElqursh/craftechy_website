import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/icon_container_widget.dart';
import 'package:craftechy_website/feature/careers/data/models/job_model.dart';
import 'package:craftechy_website/feature/careers/ui/widget/career_banner_widget.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_header_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:craftechy_website/core/constant/font_wight_helper.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final JobModel job;
    final data = GoRouterState.of(context).extra;

    if (data == null) {
      return const Scaffold(body: Center(child: Text('Job details not found')));
    }
    if (data is JobModel) {
      job = JobModel(
        id: data.id,
        jobTitle: data.jobTitle,
        jobDescription: data.jobDescription,
        iconPath: data.iconPath,
        jobRequirements: data.jobRequirements,
        jobBenefits: data.jobBenefits,
        jobLocation: data.jobLocation,
        jobType: data.jobType,
        jobSalary: data.jobSalary,
      );
    } else {
      return const Scaffold(body: Center(child: Text('Job details not found')));
    }

    return MainLayout(
      child: Column(
        children: [
          CareerBannerWidget(),
          ProcessHeaderWidget(
            title: 'Welcome to Craftechy, where talent meets opportunity!',
            description:
                'At Craftechy, we believe that the success of our agency lies in the talent, passion, and dedication of our team members. We are a digital product agency that thrives on innovation, creativity, and collaboration. If you\'re ready to make a difference and contribute to cutting-edge projects, we invite you to explore career opportunities with us.',
          ),
          Container(
            width: ResponsiveWidget.isLargeScreen(context)? MediaQuery.of(context).size.width - 342.w : ResponsiveWidget.isMediumScreen(context)? MediaQuery.of(context).size.width - 160.w : MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColor.grayColor15,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    IconContainerWidget(image: job.iconPath),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
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
                            '${job.jobLocation}. ${job.jobType}',
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
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '${job.jobDescription}\n\n${job.jobRequirements}\n\n${job.jobBenefits}',
                    style: TextStyle(
                      color: const Color(0xFFE6E6E6),
                      fontSize: 16,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                      letterSpacing: -0.10,
                    ),
                    maxLines: 100,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                verticalSpace(10),
              ],
            ),
          ),
          GetTouchFormWidget(),
        ],
      ),
    );
  }
}
class GetTouchFormWidget extends StatefulWidget {
  const GetTouchFormWidget({super.key});

  @override
  State<GetTouchFormWidget> createState() => _GetTouchFormWidgetState();
}

class _GetTouchFormWidgetState extends State<GetTouchFormWidget> {
  RangeValues rangeValues = RangeValues(500, 1000000);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width - 342.w
          : ResponsiveWidget.isMediumScreen(context)
          ? MediaQuery.of(context).size.width - 160.w
          : MediaQuery.of(context).size.width,
      padding: ResponsiveWidget.isLargeScreen(context)
          ? EdgeInsets.symmetric(horizontal: 268.0.w)
          : ResponsiveWidget.isMediumScreen(context)
          ? EdgeInsets.symmetric(horizontal: 217.0.w)
          : EdgeInsets.symmetric(horizontal: 24.0.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColor.grayColor15,
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 60.0.h),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: AppColor.grayColor15,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 30.h,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0x7F242424),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: AppColor.grayColor15,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 288.w,
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288.w,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: AppColor.grayColor20,
                              ),
                            ),
                            hint: Text(
                              'Type here',
                              style: TextStyle(
                                color: AppColor.grayColor40,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.regular,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(30),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0x7F242424),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: AppColor.grayColor15,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 288.w,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeightHelper.medium,
                            height: 1.50,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288.w,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: AppColor.grayColor20,
                              ),
                            ),
                            hint: Text(
                              'Type here',
                              style: TextStyle(
                                color: AppColor.grayColor40,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.regular,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0x7F242424),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: AppColor.grayColor15,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 288.w,
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288.w,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: AppColor.grayColor20,
                              ),
                            ),
                            hint: Text(
                              'Type here',
                              style: TextStyle(
                                color: AppColor.grayColor40,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.regular,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                horizontalSpace(30),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0x7F242424),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: AppColor.grayColor15,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 288.w,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeightHelper.medium,
                            height: 1.50,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 288.w,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: AppColor.grayColor20,
                              ),
                            ),
                            hint: Text(
                              'Type here',
                              style: TextStyle(
                                color: AppColor.grayColor40,
                                fontSize: 16.sp,
                                fontWeight: FontWeightHelper.regular,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ResponsiveWidget.isSmallScreen(context)
                ? Container(
              padding: EdgeInsets.all(30.w),
              decoration: ShapeDecoration(
                color: const Color(0x7F242424),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColor.grayColor15),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? 260.w
                        : 288.w,
                    child: Text(
                      'What makes you the ideal candidate for this position?',
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeightHelper.medium,
                        height: 1.50,
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.grayColor15,
                          width: 1,
                        ),
                      ),
                      hint: Text(
                        'Type here',
                        style: TextStyle(
                          color: AppColor.grayColor40,
                          fontSize: 16.sp,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                ],
              ),
            )
                : Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.w),
              child: Container(
                padding: EdgeInsets.all(30.w),
                decoration: ShapeDecoration(
                  color: const Color(0x7F242424),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: AppColor.grayColor15,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 288.w,
                      child: Text(
                        'What makes you the ideal candidate for this position?',
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeightHelper.medium,
                          height: 1.50,
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.grayColor15,
                            width: 1,
                          ),
                        ),
                        hint: Text(
                          'Type here',
                          style: TextStyle(
                            color: AppColor.grayColor40,
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeightHelper.regular,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveWidget.isSmallScreen(context)
                ? Container(
              padding: EdgeInsets.all(30.w),
              decoration: ShapeDecoration(
                color: const Color(0x7F242424),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColor.grayColor15),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? 260.w
                        : 288.w,
                    child: Text(
                      'Description of your experience',
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeightHelper.medium,
                        height: 1.50,
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.grayColor15,
                          width: 1,
                        ),
                      ),
                      hint: Text(
                        'Type here',
                        style: TextStyle(
                          color: AppColor.grayColor40,
                          fontSize: 16.sp,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                ],
              ),
            )
                : Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.w),
              child: Container(
                padding: EdgeInsets.all(30.w),
                decoration: ShapeDecoration(
                  color: const Color(0x7F242424),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: AppColor.grayColor15,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 288.w,
                      child: Text(
                        'Description of your experience',
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeightHelper.medium,
                          height: 1.50,
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.grayColor15,
                            width: 1,
                          ),
                        ),
                        hint: Text(
                          'Type here',
                          style: TextStyle(
                            color: AppColor.grayColor40,
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeightHelper.regular,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveWidget.isSmallScreen(context)
                ? Container(
              padding: EdgeInsets.all(30.w),
              decoration: ShapeDecoration(
                color: const Color(0x7F242424),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColor.grayColor15),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? 260.w
                        : 288.w,
                    child: Text(
                      'What are your salary expectations?',
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeightHelper.medium,
                        height: 1.50,
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.grayColor15,
                          width: 1,
                        ),
                      ),
                      hint: Text(
                        'Type here',
                        style: TextStyle(
                          color: AppColor.grayColor40,
                          fontSize: 16.sp,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                ],
              ),
            )
                : Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.w),
              child: Container(
                padding: EdgeInsets.all(30.w),
                decoration: ShapeDecoration(
                  color: const Color(0x7F242424),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: AppColor.grayColor15,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 288.w,
                      child: Text(
                        'What are your salary expectations?',
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeightHelper.medium,
                          height: 1.50,
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.grayColor15,
                            width: 1,
                          ),
                        ),
                        hint: Text(
                          'Type here',
                          style: TextStyle(
                            color: AppColor.grayColor40,
                            fontSize: 16.sp,
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeightHelper.regular,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CommonBtnWidget(
              title: 'Submit',
              borderSide: BorderSide.none,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
