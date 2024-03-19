import 'package:flutter/material.dart';

class CustomTheme {
  static const textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      letterSpacing: -0.02,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      letterSpacing: -0.02,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      letterSpacing: -0.02,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      letterSpacing: -0.02,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      letterSpacing: -0.02,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      letterSpacing: -0.02,
    ),
    labelSmall: TextStyle(
      fontSize: 9,
      letterSpacing: -0.02,
    ),
  );

  static ThemeData light = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFFEDEADE),
        surfaceTintColor: Color(0xFFFEFEE2)),
    dividerTheme: DividerThemeData(
      color: const Color(0xFF8592AD).withOpacity(0.3),
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    //colorSchemeSeed: const Color(0xFF1FA1B2),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: Color(0xFFfbfdfd),
      onBackground: Color(0xFF191c1d),
      primary: Color(0xFF094fa9),
      onPrimary: Color(0xFFffffff),
      primaryContainer: Color(0xFF96f0ff),
      onPrimaryContainer: Color(0xFF001f24),
      secondary: Color(0xFF0e58b9),
      onSecondary: Color(0xFFffffff),
      secondaryContainer: Color(0xFFcde7ec),
      onSecondaryContainer: Color(0xFF051f23),
      tertiary: Color(0xFFffb227),
      onTertiary: Color(0xFFffffff),
      tertiaryContainer: Color(0xFFd9e2ff),
      onTertiaryContainer: Color(0xFF0e1a37),
      error: Color(0xFFba1b1b),
      onError: Color(0xFFffffff),
      errorContainer: Color(0xFFffdad4),
      onErrorContainer: Color(0xFF410001),
      surface: Color(0xFFfbfdfd),
      onSurface: Color(0xFF191c1d),
      inverseSurface: Color(0xFF2d3132),
      onInverseSurface: Color(0xFFF5F5F5),
      inversePrimary: Color(0xFF50d8ec),
      surfaceVariant: Color(0xFFdbe4e6),
      onSurfaceVariant: Color(0xFF000000),
      outline: Color(0xFF70797b),
      shadow: Color(0xFF000000),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashColor: Colors.transparent,
    highlightColor: Colors.grey.shade300,
    scaffoldBackgroundColor: const Color(0xFF333333),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.white.withAlpha(200),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black87),
    ),
    fontFamily: 'Poppins',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: Colors.indigo, surfaceTintColor: Colors.blue),
    ),
    textTheme: textTheme,
    iconTheme: const IconThemeData(
      color: Color(0xFF0A255C),
      size: 20,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    //primarySwatch: Colors.blue,
    //colorSchemeSeed: const Color(0xFF1FA1B2),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      background: Color(0xFF191c1d),
      onBackground: Color(0xFFe0e3e3),
      primary: Color(0xFF094fa9),
      onPrimary: Color(0xFFe0e3e3),
      primaryContainer: Color(0xFF004f59),
      onPrimaryContainer: Color(0xFF96f0ff),
      secondary: Color(0xFF0e58b9),
      onSecondary: Color(0xFFe0e3e3),
      secondaryContainer: Color(0xFF334b4f),
      onSecondaryContainer: Color(0xFFcde7ec),
      tertiary: Color(0xFFffb227),
      onTertiary: Color(0xFF242f4d),
      tertiaryContainer: Color(0xFF3b4665),
      onTertiaryContainer: Color(0xFFd9e2ff),
      error: Color(0xFFffb4a9),
      onError: Color(0xFF680003),
      errorContainer: Color(0xFF930006),
      onErrorContainer: Color(0xFFffb4a9),
      surface: Color(0xFF191c1d),
      onSurface: Color(0xFFe0e3e3),
      inverseSurface: Color(0xFFe0e3e3),
      onInverseSurface: Color(0xFF2d3132),
      inversePrimary: Color(0xFF006875),
      surfaceVariant: Color(0xFF3f484a),
      onSurfaceVariant: Color(0xFFbfc8ca),
      outline: Color(0xFF899294),
      shadow: Color(0xFF000000),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashColor: Colors.transparent,
    highlightColor: Colors.grey.shade800,
    scaffoldBackgroundColor: const Color(0xFF141414),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.black.withAlpha(180),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white70),
    ),
    fontFamily: 'Poppins',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
    textTheme: textTheme,
    iconTheme: const IconThemeData(
      color: Color(0xFF0A255C),
      size: 20,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
