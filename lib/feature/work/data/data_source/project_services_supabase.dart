import 'package:craftechy_website/feature/work/data/model/project_model.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProjectSupabaseService {
  final SupabaseClient client = Supabase.instance.client;
  final String _tableName = 'ProjectTable';

  // CREATE
  Future<void> createProject(ProjectModel project) async {
    await client.from(_tableName).insert({
      ...project.toMap(),
    });
  }

  // READ ALL
  Future<List<ProjectModel>> getAllProjects() async {
    final response = await client.from(_tableName).select();
    if (kDebugMode) {
      print('Supabase response: $response');
    } // <--- Add this
    return (response as List).map((e) => ProjectModel.fromMap(e)).toList();
  }

  // READ BY ID
  Future<ProjectModel?> getProjectById(String id) async {
    final response =
    await client.from(_tableName).select().eq('id', id).maybeSingle();
    if (response == null) return null;
    return ProjectModel.fromMap(response);
  }

  // UPDATE
  Future<void> updateProject(ProjectModel project) async {
    await client
        .from(_tableName)
        .update(project.toMap())
        .eq('id', project.id as Object); // safer than eq('projectTitle')
  }

  // DELETE
  Future<void> deleteProject(String id) async {
    await client.from(_tableName).delete().eq('id', id);
  }
}
