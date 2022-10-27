import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData light(){
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xFF5F6DF8)
      ),
      scaffoldBackgroundColor: const Color(0xFFF3F3F4)
    );
  }
  static ThemeData dark(){
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}