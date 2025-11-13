import 'package:craftechy_website/feature/careers/data/data_source/apply_service_supabase.dart';
import 'package:craftechy_website/feature/careers/data/models/apply_model.dart';

class ApplyRepository {
  final ApplySupabaseService _service = ApplySupabaseService();

  Future<void> addApply(ApplyModel apply) => _service.createApply(apply);
  Future<List<ApplyModel>> fetchApply() => _service.getAllApply();
  Future<ApplyModel?> getApply(String id) => _service.getApplyById(id);
  Future<void> editApply(ApplyModel apply) => _service.updateApply(apply);
  Future<void> removeApply(String id) => _service.deleteApply(id);
}