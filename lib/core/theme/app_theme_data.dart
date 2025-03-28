import 'package:flutter/material.dart';

class AppThemeData {
  static const Color _primaryColor = Color(0xFF7a5d3e);
  static const Color _inputErrorColor = Color(0xFFD36161);
  static const Color _inputFillColor = Color(0xffF8F8FA);
  static const Color _backgroundColor = Color(0xffFfffff);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: _primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _backgroundColor,
      foregroundColor: _primaryColor,
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 48)),
        backgroundColor: const WidgetStatePropertyAll(_primaryColor),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        )),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size(40, 40)),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: const WidgetStatePropertyAll(_primaryColor),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        )),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        color: Color(0xff494A57),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: _primaryColor,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: _inputErrorColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: _inputErrorColor,
          width: 2,
        ),
      ),
      fillColor: _inputFillColor,
      filled: true,
    ),
  );
}
