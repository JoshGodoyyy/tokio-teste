import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Color(0xff21212b),
    primaryColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff212121),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      bodyMedium: GoogleFonts.roboto(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.roboto(color: Colors.white),
      hintStyle: GoogleFonts.roboto(color: Colors.white54),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffBDBDBD)),
      ),
    ),
    useMaterial3: true,
  );
}
