import 'package:craftechy_website/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
 AppTheme._();

 static ThemeData darkTheme = ThemeData(
   brightness: Brightness.dark,
   primaryColor: AppColor.greenColor50,
   scaffoldBackgroundColor: AppColor.grayColor10,
   fontFamily: GoogleFonts.barlow().fontFamily,
   textTheme: GoogleFonts.barlowTextTheme(),
 );
}