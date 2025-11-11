import 'package:craftechy_website/core/constant/font_wight_helper.dart';
import 'package:craftechy_website/core/constant/responsive.dart';
import 'package:craftechy_website/core/theme/color.dart';
import 'package:craftechy_website/feature/work/data/repository/project_repository.dart';
import 'package:craftechy_website/feature/work/logic/project_cubit.dart';
import 'package:craftechy_website/feature/work/ui/widget/work_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkPart extends StatelessWidget {
  const WorkPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectCubit(ProjectRepository())..fetchProjects(),
      child: BlocBuilder<ProjectCubit, ProjectState>(
        builder: (context, state) {
          if (state is ProjectLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.greenColor50),
            );
          } else if (state is ProjectLoaded) {
            final projects = state.projects;
            return Container(
              width: ResponsiveWidget.isLargeScreen(context)
                  ? MediaQuery.of(context).size.width - 342.w
                  : ResponsiveWidget.isMediumScreen(context)
                  ? MediaQuery.of(context).size.width - 160.w
                  : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: AppColor.grayColor15,
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double itemWidth = ResponsiveWidget.isSmallScreen(context)
                      ? (constraints.maxWidth)
                      : (constraints.maxWidth) / 2;
                  return Wrap(
                    children: List.generate(projects.length, (index) {
                      return SizedBox(
                        width: itemWidth,
                        child: WorkItem(project: projects[index]),
                      );
                    }),
                  );
                },
              ),
            );
          } else if (state is ProjectError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
