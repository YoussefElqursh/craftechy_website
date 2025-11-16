import 'package:supabase_flutter/supabase_flutter.dart';

class GetInTouchSupabaseService {
  final SupabaseClient supabase = Supabase.instance.client;
  Future<void> submitForm({
    required String name,
    required String email,
    required List<String> selectedReasons,
    required double minBudget,
    required double maxBudget,
    required String message,
  }) async {
    try {
      // Example: insert into Supabase table
      final response = await supabase.from('get_in_touch').insert({
        'full_name': name,
        'email': email,
        'selectedReasons': selectedReasons,
        'budget_from': minBudget,
        'budget_to': maxBudget,
        'message': message,
      });
    } catch (e) {
      throw Exception('Failed to submit form: $e');
    }
  }
}
