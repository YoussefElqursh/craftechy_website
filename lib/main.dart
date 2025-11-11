import 'package:craftechy_website/core/api/supabase_helper.dart';
import 'package:craftechy_website/layout/craftechy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SupabaseHelper.init();
  runApp(const Craftechy());
}