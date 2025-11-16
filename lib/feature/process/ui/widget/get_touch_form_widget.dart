import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/constant/spacing_helper.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/core/widget/common_btn_widget.dart';
import 'package:craftechy_website/feature/home/data/data_source/get_in_touch_supabase_service.dart';
import 'package:craftechy_website/feature/home/data/q_a.dart';
import 'package:craftechy_website/feature/home/data/repository/get_in_touch_repository.dart';
import 'package:craftechy_website/feature/home/logic/get_in_touch_cubit.dart';
import 'package:craftechy_website/feature/home/logic/get_in_touch_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetTouchFormWidget extends StatefulWidget {
  const GetTouchFormWidget({super.key});

  @override
  State<GetTouchFormWidget> createState() => _GetTouchFormWidgetState();
}

class _GetTouchFormWidgetState extends State<GetTouchFormWidget> {
  // your controllers
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  List<String> selectedReasons = [];
  RangeValues rangeValues = RangeValues(500, 1000000);
  late List<bool> checkStates;

  @override
  void initState() {
    super.initState();
    checkStates = List.filled(listOFCheckBox.length, false);
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels rangeLabels = RangeLabels(
      rangeValues.start.toString(),
      rangeValues.end.toString(),
    );
    return BlocProvider(
      create: (_) =>
          GetInTouchCubit(GetInTouchRepository(GetInTouchSupabaseService())),
      child: BlocConsumer<GetInTouchCubit, GetInTouchState>(
        listener: (context, state) {
          if (state is GetInTouchSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Message sent successfully!"),
                backgroundColor: Colors.green,
              ),
            );

            // Clear UI
            nameController.clear();
            emailController.clear();
            messageController.clear();
            setState(() {
              selectedReasons = [];
              rangeValues = const RangeValues(500, 1000000);
              checkStates = List.filled(listOFCheckBox.length, false);
            });
          }

          if (state is GetInTouchFailure) {
            // Safely handle null error
            final errorMessage = state.error;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
            if (kDebugMode) {
              print('Error: $errorMessage');
            }
          }
        },
        builder: (context, state) {
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
                                              fontWeight:
                                                  FontWeightHelper.regular,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeightHelper.regular,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
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
                                        controller: emailController,
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
                                              fontWeight:
                                                  FontWeightHelper.regular,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeightHelper.regular,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
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
                                              fontWeight:
                                                  FontWeightHelper.regular,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeightHelper.regular,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
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
                                        controller: emailController,
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
                                              fontWeight:
                                                  FontWeightHelper.regular,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeightHelper.regular,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 30,
                              children: [
                                SizedBox(
                                  width: ResponsiveWidget.isSmallScreen(context)
                                      ? 250.w
                                      : 650.w,
                                  child: Text(
                                    'Why are you contacting us?',
                                    style: TextStyle(
                                      color: AppColor.whiteColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeightHelper.medium,
                                      height: 1.50,
                                    ),
                                  ),
                                ),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    double itemWidth =
                                        ResponsiveWidget.isSmallScreen(context)
                                        ? (constraints.maxWidth)
                                        : (constraints.maxWidth) / 2;
                                    return Wrap(
                                      children: List.generate(listOFCheckBox.length, (
                                        index,
                                      ) {
                                        return SizedBox(
                                          width: itemWidth,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            spacing: 10,
                                            children: [
                                              Checkbox(
                                                value: checkStates[index],
                                                onChanged: (value) {
                                                  setState(() {
                                                    checkStates[index] =
                                                        value ?? false;

                                                    String reason =
                                                        listOFCheckBox[index]['value']!;

                                                    if (value == true) {
                                                      selectedReasons.add(
                                                        reason,
                                                      );
                                                    } else {
                                                      selectedReasons.remove(
                                                        reason,
                                                      );
                                                    }
                                                  });
                                                },
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                activeColor:
                                                    AppColor.grayColor15,
                                                visualDensity:
                                                    const VisualDensity(
                                                      horizontal: -4,
                                                      vertical: 0,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    width: 1,
                                                    color: AppColor.grayColor20,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        4.r,
                                                      ),
                                                ),
                                                checkColor:
                                                    AppColor.greenColor50,
                                                side: BorderSide(
                                                  width: 1,
                                                  color: AppColor.grayColor20,
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    ResponsiveWidget.isSmallScreen(
                                                      context,
                                                    )
                                                    ? 200.w
                                                    : 260.w,
                                                child: Text(
                                                  listOFCheckBox[index]['value']!,
                                                  style: TextStyle(
                                                    color: const Color(
                                                      0xFFFCFFF9,
                                                    ),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeightHelper
                                                        .regular,
                                                    height: 1.50,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 55.0.w),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 30,
                                children: [
                                  SizedBox(
                                    width: 650.w,
                                    child: Text(
                                      'Why are you contacting us?',
                                      style: TextStyle(
                                        color: AppColor.whiteColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeightHelper.medium,
                                        height: 1.50,
                                      ),
                                    ),
                                  ),
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      double itemWidth =
                                          ResponsiveWidget.isSmallScreen(
                                            context,
                                          )
                                          ? (constraints.maxWidth)
                                          : (constraints.maxWidth) / 2;
                                      return Wrap(
                                        children: List.generate(
                                          listOFCheckBox.length,
                                          (index) {
                                            return SizedBox(
                                              width: itemWidth,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                spacing: 10,
                                                children: [
                                                  Checkbox(
                                                    value: checkStates[index],
                                                    onChanged: (value) {
                                                      setState(() {
                                                        checkStates[index] =
                                                            value ?? false;

                                                        String reason =
                                                            listOFCheckBox[index]['value']!;

                                                        if (value == true) {
                                                          selectedReasons.add(
                                                            reason,
                                                          );
                                                        } else {
                                                          selectedReasons
                                                              .remove(reason);
                                                        }
                                                      });
                                                    },
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    activeColor:
                                                        AppColor.grayColor15,
                                                    visualDensity:
                                                        const VisualDensity(
                                                          horizontal: -4,
                                                          vertical: 0,
                                                        ),
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        width: 1,
                                                        color: AppColor
                                                            .grayColor20,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4.r,
                                                          ),
                                                    ),
                                                    checkColor:
                                                        AppColor.greenColor50,
                                                    side: BorderSide(
                                                      width: 1,
                                                      color:
                                                          AppColor.grayColor20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 260.w,
                                                    child: Text(
                                                      listOFCheckBox[index]['value']!,
                                                      style: TextStyle(
                                                        color: const Color(
                                                          0xFFFCFFF9,
                                                        ),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeightHelper
                                                                .regular,
                                                        height: 1.50,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
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
                                    'Your Budget',
                                    style: TextStyle(
                                      color: AppColor.whiteColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeightHelper.medium,
                                      height: 1.50,
                                    ),
                                  ),
                                ),
                                verticalSpace(14),
                                SizedBox(
                                  width: ResponsiveWidget.isSmallScreen(context)
                                      ? 260.w
                                      : 288.w,
                                  child: Text(
                                    'Slide to indicate your budget range',
                                    style: TextStyle(
                                      color: AppColor.grayColor90,
                                      fontSize: 16,
                                      fontWeight: FontWeightHelper.medium,
                                      height: 1.50,
                                      letterSpacing: -0.10,
                                    ),
                                  ),
                                ),
                                verticalSpace(30),
                                RangeSlider(
                                  values: rangeValues,
                                  onChanged: (value) {
                                    setState(() {
                                      rangeValues = value;
                                    });
                                  },
                                  activeColor: AppColor.greenColor50,
                                  inactiveColor: AppColor.grayColor20,
                                  labels: rangeLabels,
                                  max: 1000000,
                                  min: 500,
                                  divisions: 200,
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 55.0.w),
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
                                      'Your Budget',
                                      style: TextStyle(
                                        color: AppColor.whiteColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeightHelper.medium,
                                        height: 1.50,
                                      ),
                                    ),
                                  ),
                                  verticalSpace(14),
                                  SizedBox(
                                    width: 288.w,
                                    child: Text(
                                      'Slide to indicate your budget range',
                                      style: TextStyle(
                                        color: AppColor.grayColor90,
                                        fontSize: 16,
                                        fontWeight: FontWeightHelper.medium,
                                        height: 1.50,
                                        letterSpacing: -0.10,
                                      ),
                                    ),
                                  ),
                                  verticalSpace(30),
                                  RangeSlider(
                                    values: rangeValues,
                                    onChanged: (value) {
                                      setState(() {
                                        rangeValues = value;
                                      });
                                    },
                                    activeColor: AppColor.greenColor50,
                                    inactiveColor: AppColor.grayColor20,
                                    labels: rangeLabels,
                                    max: 1000000,
                                    min: 500,
                                    divisions: 200,
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
                                    'Your Message',
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
                                  controller: messageController,
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
                                      'Your Message',
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
                                    controller: messageController,
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<GetInTouchCubit>().submitForm(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            selectedReasons: selectedReasons,
                            minBudget: rangeValues.start,
                            maxBudget: rangeValues.end,
                            message: messageController.text.trim(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
