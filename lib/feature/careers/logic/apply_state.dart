part of 'apply_cubit.dart';

abstract class ApplyState {}

class ApplyInitial extends ApplyState {}

class ApplyLoading extends ApplyState {}

class ApplyLoaded extends ApplyState {
  final List<ApplyModel> apply;
  ApplyLoaded(this.apply);
}

class ApplyError extends ApplyState {
  final String message;
  ApplyError(this.message);
}