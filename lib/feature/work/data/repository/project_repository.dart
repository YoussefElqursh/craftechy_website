import 'package:craftechy_website/feature/work/data/data_source/project_services_supabase.dart';
import 'package:craftechy_website/feature/work/data/model/project_model.dart';

class ProjectRepository {
  final ProjectSupabaseService _service = ProjectSupabaseService();

  Future<void> addProject(ProjectModel project) => _service.createProject(project);
  Future<List<ProjectModel>> fetchProjects() => _service.getAllProjects();
  Future<ProjectModel?> getProject(String id) => _service.getProjectById(id);
  Future<void> editProject(ProjectModel project) => _service.updateProject(project);
  Future<void> removeProject(String id) => _service.deleteProject(id);
}
