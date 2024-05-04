import 'package:flutter/material.dart';

ThemeData themeApp() {
  return ThemeData(
    textTheme: const TextTheme(
      // Example: White color
      bodyMedium: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      ),
    ),
  );
}
