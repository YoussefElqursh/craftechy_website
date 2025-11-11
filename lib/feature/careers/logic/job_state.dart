part of 'job_cubit.dart';

abstract class JobState {}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  final List<JobModel> jobs;
  JobLoaded(this.jobs);
}

class JobError extends JobState {
  final String message;
  JobError(this.message);
}