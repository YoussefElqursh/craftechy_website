import 'package:craftechy_website/feature/careers/data/models/job_model.dart';
import 'package:craftechy_website/feature/careers/data/repository/job_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobRepository repository;

  JobCubit(this.repository) : super(JobInitial());
  

  Future<void> fetchJobs() async {
    emit(JobLoading());
    try {
      final jobs = await repository.fetchJobs(); // already List<JobModel>
      emit(JobLoaded(jobs));
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> addJob(JobModel job) async {
    try {
      await repository.addJob(job);
      fetchJobs(); // refresh list after adding
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> deleteJob(String id) async {
    try {
      await repository.removeJob(id);
      fetchJobs(); // refresh list after deleting
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }
}
