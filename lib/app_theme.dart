import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color black=Color(0xff171717);
  static const Color white=Color(0xffFFFFFF);
  static const Color grey=Color(0xffA0A0A0);
  static ThemeData darkMode=ThemeData(
    primaryColor: black,
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: black,
      foregroundColor: white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      )


    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: white

      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
          color: white

      ),
      labelMedium:TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: white


      ),
      labelSmall:TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: white


      ),
      displaySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: grey


      ),


    )



  );



}