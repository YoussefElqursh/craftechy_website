import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  static final SupabaseHelper instance = SupabaseHelper._();

  SupabaseHelper._();

  static final supabase = Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://eznxlcchhyemrppknvah.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV6bnhsY2NoaHllbXJwcGtudmFoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjIxNjUwODYsImV4cCI6MjA3Nzc0MTA4Nn0.HlCBo1s_okd__9vXS8JNab6KP_D854xzhnOBG0yqDQE',
    );
  }
}