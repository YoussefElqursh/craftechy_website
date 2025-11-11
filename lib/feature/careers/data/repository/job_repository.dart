import 'package:craftechy_website/feature/careers/data/models/job_model.dart';
import 'package:craftechy_website/feature/careers/data/data_source/job_services_supabase.dart';

class JobRepository {
  final JobSupabaseService _service = JobSupabaseService();

  Future<void> addJob(JobModel job) => _service.createJob(job);
  Future<List<JobModel>> fetchJobs() => _service.getAllJobs();
  Future<JobModel?> getJob(String id) => _service.getJobById(id);
  Future<void> editJob(JobModel job) => _service.updateJob(job);
  Future<void> removeJob(String id) => _service.deleteJob(id);
}
