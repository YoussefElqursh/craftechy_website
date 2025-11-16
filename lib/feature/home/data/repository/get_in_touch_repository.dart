import 'package:craftechy_website/feature/home/data/data_source/get_in_touch_supabase_service.dart';

class GetInTouchRepository {
  final GetInTouchSupabaseService service;

  GetInTouchRepository(this.service);

  Future<void> submitForm({
    required String name,
    required String email,
    required List<String> selectedReasons,
    required double minBudget,
    required double maxBudget,
    required String message,
  }) async {
    // Call your service here
    await service.submitForm(
      name: name,
      email: email,
      selectedReasons: selectedReasons,
      minBudget: minBudget,
      maxBudget: maxBudget,
      message: message,
    );
  }
}
