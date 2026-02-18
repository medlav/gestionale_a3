// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (c) 2026 medlav.app

import 'package:flutter/material.dart';

class AppTheme {
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color mediumGray = Color(0xFF888888);
  static const Color darkGray = Color(0xFF333333);
  static const Color black = Color(0xFF000000);
  static const Color accentRed = Color(0xFFDC2626);

  // Dark Mode Palette
  static const Color bgDark = Color(0xFF0A0A0A);
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color accentRedDark = Color(0xFFFF3333);

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ButtonStyle get buttonAccent =>
      ElevatedButton.styleFrom(
        backgroundColor: accentRed,
        foregroundColor: white,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        side: const BorderSide(color: black, width: 2),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(black.withValues(alpha: .1)),
      );

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final bgColor = isDark ? bgDark : white;
    final surfaceColor = isDark ? surfaceDark : lightGray;
    final txtColor = isDark ? lightGray : black;
    final accent = isDark ? accentRedDark : accentRed;
    final borderColor = isDark ? darkGray : mediumGray;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: bgColor,

      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: brightness,
        primary: accent,
        onPrimary: white,
        surface: surfaceColor,
        onSurface: txtColor,
        error: accentRed,
      ).copyWith(primary: accent, surface: surfaceColor, outline: borderColor),

      cardTheme: CardThemeData(
        color: surfaceColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(accent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),

      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: accent,
          letterSpacing: 2.4,
          fontFamily: 'Roboto',
        ),
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: txtColor,
          letterSpacing: 1.2,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: txtColor,
          fontFamily: 'Verdana',
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? black : black,
        foregroundColor: white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: white,
        ),
        shape: Border(bottom: BorderSide(color: accent, width: 4)),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: accent, width: 3),
        ),
        labelStyle: TextStyle(color: txtColor, fontWeight: FontWeight.bold),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? accent : black,
          foregroundColor: white,
          minimumSize: const Size.fromHeight(56),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          elevation: 0,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),

      dividerTheme: DividerThemeData(color: accent, thickness: 4),
    );
  }
}
