
import 'package:craftechy_website/feature/careers/data/repository/Apply_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:craftechy_website/feature/careers/data/models/apply_model.dart';

part 'apply_state.dart';

class ApplyCubit extends Cubit<ApplyState> {
  final ApplyRepository repository;

  ApplyCubit(this.repository) : super(ApplyInitial());


  Future<void> fetchApply() async {
    emit(ApplyLoading());
    try {
      final apply = await repository.fetchApply(); // already List<ApplyModel>
      emit(ApplyLoaded(apply));
    } catch (e) {
      emit(ApplyError(e.toString()));
    }
  }

  Future<void> addApply(ApplyModel apply) async {
    try {
      await repository.addApply(apply);
      fetchApply(); // refresh list after adding
    } catch (e) {
      emit(ApplyError(e.toString()));
    }
  }

  Future<void> deleteApply(String id) async {
    try {
      await repository.removeApply(id);
      fetchApply(); // refresh list after deleting
    } catch (e) {
      emit(ApplyError(e.toString()));
    }
  }
}
