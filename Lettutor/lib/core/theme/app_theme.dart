import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.primary,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: Colors.black12,
            )),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        isDense: true,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.blue,
            ),
            elevation: 0,
          )),
      // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.lightGrey,
        error: AppColors.error,
        background: AppColors.black,
      ),
      // backgroundColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.black,
      ),
    );
  }
}
