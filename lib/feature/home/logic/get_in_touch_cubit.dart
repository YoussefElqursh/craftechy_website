import 'package:craftechy_website/feature/home/data/repository/get_in_touch_repository.dart';
import 'package:craftechy_website/feature/home/logic/get_in_touch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetInTouchCubit extends Cubit<GetInTouchState> {
  final GetInTouchRepository repository;

  GetInTouchCubit(this.repository) : super(GetInTouchInitial());

  Future<void> submitForm({
    required String name,
    required String email,
    required List<String> selectedReasons,
    required double minBudget,
    required double maxBudget,
    required String message,
  }) async {
    try {
      await repository.submitForm(
        name: name,
        email: email,
        selectedReasons: selectedReasons,
        minBudget: minBudget,
        maxBudget: maxBudget,
        message: message,
      );
      emit(GetInTouchSuccess());
    } catch (e) {
      emit(GetInTouchFailure(error: e.toString()));
    }
  }
}
