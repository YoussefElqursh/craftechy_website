import 'package:craftechy_website/feature/work/data/model/project_model.dart';
import 'package:craftechy_website/feature/work/data/repository/project_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectRepository repository;

  ProjectCubit(this.repository) : super(ProjectInitial());


  Future<void> fetchProjects() async {
    emit(ProjectLoading());
    try {
      final projects = await repository.fetchProjects(); // already List<JobModel>
      emit(ProjectLoaded(projects));
    } catch (e) {
      emit(ProjectError(e.toString()));
    }
  }

  Future<void> addProject(ProjectModel project) async {
    try {
      await repository.addProject(project);
      fetchProjects(); // refresh list after adding
    } catch (e) {
      emit(ProjectError(e.toString()));
    }
  }

  Future<void> deleteProject(String id) async {
    try {
      await repository.removeProject(id);
      fetchProjects(); // refresh list after deleting
    } catch (e) {
      emit(ProjectError(e.toString()));
    }
  }
}
