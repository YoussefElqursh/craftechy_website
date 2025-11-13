import 'dart:io';

import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:craftechy_website/core/widget/icon_container_widget.dart';
import 'package:craftechy_website/feature/careers/data/models/apply_model.dart';
import 'package:craftechy_website/feature/careers/data/models/job_model.dart';
import 'package:craftechy_website/feature/careers/data/repository/Apply_repository.dart';
import 'package:craftechy_website/feature/careers/ui/widget/career_banner_widget.dart';
import 'package:craftechy_website/feature/process/ui/widget/process_header_widget.dart';
import 'package:craftechy_website/layout/main_layout.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // 👈 for web detection
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
            width: ResponsiveWidget.isLargeScreen(context)
                ? MediaQuery.of(context).size.width - 342.w
                : ResponsiveWidget.isMediumScreen(context)
                ? MediaQuery.of(context).size.width - 160.w
                : MediaQuery.of(context).size.width,
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
          GetTouchFormWidget(job: job),
        ],
      ),
    );
  }
}

class GetTouchFormWidget extends StatefulWidget {
  final JobModel job;

  const GetTouchFormWidget({super.key, required this.job});

  @override
  State<GetTouchFormWidget> createState() => _GetTouchFormWidgetState();
}

class _GetTouchFormWidgetState extends State<GetTouchFormWidget> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final firstQuestionController = TextEditingController();
  final secondQuestionController = TextEditingController();
  final thirdQuestionController = TextEditingController();
  final cvFileController = TextEditingController();
  File? selectedFile;
  bool isUploading = false;
  final supabase = Supabase.instance.client;

  Future<void> pickAndUploadFiles(
    BuildContext context,
    TextEditingController cvFileController,
  ) async {
    try {
      final supabase = Supabase.instance.client;

      // ✅ Web doesn't need permissions
      if (!kIsWeb) {
        PermissionStatus status;

        if (Platform.isAndroid) {
          status = await Permission.storage.request();
        } else if (Platform.isIOS) {
          status = await Permission.photos.request();
        } else {
          status = await Permission.storage.request(); // desktop
        }

        if (!status.isGranted) {
          ScaffoldMessenger.of(
            // ignore: use_build_context_synchronously
            context,
          ).showSnackBar(const SnackBar(content: Text('File access denied')));
          return;
        }
      }

      // 📂 Pick a file
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.any,
      );

      if (result == null || result.files.isEmpty) {
        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(const SnackBar(content: Text('No file selected')));
        return;
      }

      final file = result.files.single;
      final fileName = '${DateTime.now().millisecondsSinceEpoch}_${file.name}';
      final bucketName = 'cvs_files'; // change to your bucket name

      if (kIsWeb) {
        // 🌐 Web upload using bytes
        final fileBytes = file.bytes;
        if (fileBytes == null) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to read file bytes')),
          );
          return;
        }

        await supabase.storage
            .from(bucketName)
            .uploadBinary(fileName, fileBytes);
      } else {
        // 📱 Mobile/Desktop upload using File()
        final filePath = file.path!;
        await supabase.storage
            .from(bucketName)
            .upload(fileName, File(filePath));
      }

      // 🌍 Get public URL
      final publicUrl = supabase.storage
          .from(bucketName)
          .getPublicUrl(fileName);

      // ✅ Update controller
      cvFileController.text = publicUrl;
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('File uploaded successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text('Upload failed: $e')));
    }
  }

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
        child: Form(
          key: formKey,
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
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
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
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
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
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
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
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
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
                          TextFormField(
                            controller: firstQuestionController,
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
                            TextFormField(
                              controller: firstQuestionController,
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
                          TextFormField(
                            controller: secondQuestionController,
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
                            TextFormField(
                              controller: secondQuestionController,
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
                          TextFormField(
                            controller: thirdQuestionController,
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
                            TextFormField(
                              controller: thirdQuestionController,
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
                            width: ResponsiveWidget.isSmallScreen(context)
                                ? 260.w
                                : 288.w,
                            child: Text(
                              'Upload your CV',
                              style: TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeightHelper.medium,
                                height: 1.50,
                              ),
                            ),
                          ),
                          verticalSpace(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (selectedFile != null)
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Image.file(
                                      selectedFile!,
                                      height: 120.h,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ElevatedButton.icon(
                                onPressed: isUploading
                                    ? null
                                    : () => pickAndUploadFiles(
                                        context,
                                        cvFileController,
                                      ),
                                icon: const Icon(Icons.upload_file),
                                label: Text(
                                  isUploading ? 'Uploading...' : 'Upload File',
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.greenColor50,
                                  foregroundColor: AppColor.grayColor15,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ),
                              if (cvFileController.text.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: Text(
                                    'Uploaded URL: ${cvFileController.text}',
                                    style: TextStyle(
                                      color: AppColor.grayColor90,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                            ],
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
                                'Upload your CV',
                                style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeightHelper.medium,
                                  height: 1.50,
                                ),
                              ),
                            ),
                            verticalSpace(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (selectedFile != null)
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Image.file(
                                        selectedFile!,
                                        height: 120.h,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ElevatedButton.icon(
                                  onPressed: isUploading
                                      ? null
                                      : () => pickAndUploadFiles(
                                          context,
                                          cvFileController,
                                        ),
                                  icon: const Icon(Icons.upload_file),
                                  label: Text(
                                    isUploading
                                        ? 'Uploading...'
                                        : 'Upload File',
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.greenColor50,
                                    foregroundColor: AppColor.grayColor15,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                                if (cvFileController.text.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child: Text(
                                      'Uploaded URL: ${cvFileController.text}',
                                      style: TextStyle(
                                        color: AppColor.grayColor90,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
              CommonBtnWidget(
                title: 'Submit',
                borderSide: BorderSide.none,
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;
                  final apply = ApplyModel(
                    jobId: widget.job.id!,
                    name: nameController.text,
                    email: emailController.text,
                    firstQuestion: firstQuestionController.text,
                    secondQuestion: secondQuestionController.text,
                    thirdQuestion: thirdQuestionController.text,
                    cvFile: cvFileController.text,
                  );
                  final repo = ApplyRepository();
                  await repo.addApply(apply);
                  if (context.mounted) context.pop(true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
