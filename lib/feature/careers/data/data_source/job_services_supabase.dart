import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:craftechy_website/feature/careers/data/models/job_model.dart';

class JobSupabaseService {
  final SupabaseClient client = Supabase.instance.client;
  final String _tableName = 'JobTable';

  // CREATE
  Future<void> createJob(JobModel job) async {
    final userId = client.auth.currentUser?.id;
    await client.from(_tableName).insert({
      ...job.toMap(),
      'user_id': userId, // Required if RLS uses user_id policy
    });
  }

  // READ ALL
  Future<List<JobModel>> getAllJobs() async {
    final response = await client.from(_tableName).select();
    return (response as List).map((e) => JobModel.fromMap(e)).toList();
  }

  // READ BY ID
  Future<JobModel?> getJobById(String id) async {
    final response =
    await client.from(_tableName).select().eq('id', id).maybeSingle();
    if (response == null) return null;
    return JobModel.fromMap(response);
  }

  // UPDATE
  Future<void> updateJob(JobModel job) async {
    await client
        .from(_tableName)
        .update(job.toMap())
        .eq('id', job.id as Object); // safer than eq('jobTitle')
  }

  // DELETE
  Future<void> deleteJob(String id) async {
    await client.from(_tableName).delete().eq('id', id);
  }
}
