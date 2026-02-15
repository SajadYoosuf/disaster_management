import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors from Figma
  static const Color darkBackground = Color(0xFF10121B); // Main BG
  static const Color surfaceColor = Color(0xFF1B1E2B); // Card/Sidebar BG
  static const Color primaryColor = Color(0xFF2E3446); // Accents/Secondary BG
  static const Color accentBlue = Color(0xFF3B82F6); // Buttons/Highlights
  static const Color textWhite = Colors.white;
  static const Color textGrey = Color(0xFFAAAAAA);

  // Status Colors
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        background: darkBackground,
        surface: surfaceColor,
        primary: accentBlue,
        secondary: primaryColor,
        error: danger,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: textWhite, displayColor: textWhite),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        hintStyle: const TextStyle(color: textGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: accentBlue),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
    );
  }
}
