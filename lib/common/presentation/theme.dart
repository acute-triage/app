import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// This is the theme of your application.
//
// TRY THIS: Try running your application with "flutter run". You'll see
// the application has a purple toolbar. Then, without quitting the app,
// try changing the seedColor in the colorScheme below to Colors.green
// and then invoke "hot reload" (save your changes or press the "hot
// reload" button in a Flutter-supported IDE, or press "r" if you used
// the command line to start the app).
//
// Notice that the counter didn't reset back to zero; the application
// state is not lost during the reload. To reset the state, use hot
// restart instead.
//
// This works for code too, not just values: Most code changes can be
// tested with just a hot reload.
class AppTheme {
  static TextStyle display = GoogleFonts.montserrat();
  static TextStyle headline = GoogleFonts.montserrat();
  static TextStyle body = GoogleFonts.montserrat();

  static TextTheme get textTheme => TextTheme(
        titleLarge: GoogleFonts.montserrat(),
        headlineMedium: GoogleFonts.montserrat(
          height: 1,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: GoogleFonts.montserrat(
          height: 1,
        ),
      );

  static ThemeData get lightThemeData {
    return ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      textTheme: textTheme,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF387AF2)),
      cardColor: Colors.transparent,
      dividerColor: Colors.grey[400],
      cardTheme: const CardTheme(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }

  static ThemeData get darkThemeData {
    return lightThemeData.copyWith(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF387AF2),
        background: Color(0xFF151A22),
      ),
      scaffoldBackgroundColor: const Color(0xFF151A22),
      // topbar color
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF151A22),
        foregroundColor: Colors.white,
      ),
      textTheme: textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
    );
  }
}
