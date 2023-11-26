import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData buildTheme() {
    final baseData = ThemeData.light();
    final textTheme = baseData.textTheme;
    final newTextTheme = textTheme.copyWith(
      headlineLarge: GoogleFonts.nunito(
        fontSize: 32.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.nunito(
        fontSize: 18.sp,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 24.sp,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: GoogleFonts.nunito(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.nunito(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );

    return baseData.copyWith(
      textTheme: newTextTheme,
    );
  }
}
