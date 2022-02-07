import 'package:flutter/material.dart';
import 'package:stayria_frontend/constant/theme/color.dart';

ThemeData lightTheme() => ThemeData.light().copyWith(
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: topTitleTextColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
          color: dayTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          color: dayTextColor,
          fontSize: 20,
        ),
        subtitle2: TextStyle(
          color: dayTextColor,
          fontSize: 18,
        ),
      ),
    );
