import 'package:craftechy_website/feature/careers/data/models/apply_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApplySupabaseService {
  final SupabaseClient client = Supabase.instance.client;
  final String _tableName = 'ApplyTable';

  // CREATE
  Future<void> createApply(ApplyModel apply) async {
    await client.from(_tableName).insert({
      ...apply.toMap(),
    });
  }

  // READ ALL
  Future<List<ApplyModel>> getAllApply() async {
    final response = await client.from(_tableName).select();
    return (response as List).map((e) => ApplyModel.fromMap(e)).toList();
  }

  // READ BY ID
  Future<ApplyModel?> getApplyById(String id) async {
    final response =
    await client.from(_tableName).select().eq('id', id).maybeSingle();
    if (response == null) return null;
    return ApplyModel.fromMap(response);
  }

  // UPDATE
  Future<void> updateApply(ApplyModel apply) async {
    await client
        .from(_tableName)
        .update(apply.toMap())
        .eq('id', apply.id as Object); // safer than eq('applyTitle')
  }

  // DELETE
  Future<void> deleteApply(String id) async {
    await client.from(_tableName).delete().eq('id', id);
  }
}
