import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData light(){
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.indigo
      ),
    );
  }
  static ThemeData dark(){
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}