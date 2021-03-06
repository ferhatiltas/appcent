import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight? get instance {
    _instace ??= TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();

  final TextStyle headline1 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
  );

  final TextStyle headline2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w300,
  );
  final TextStyle headline3 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w200,
  );
  final TextStyle headline4 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  final TextStyle headline5 = TextStyle(
    fontSize: 18.sp,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w500,
  );
  final TextStyle headline6 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );
  final TextStyle bodyText = TextStyle(
    color: const Color(0xff707070),
    fontSize: 15.sp,
  );
  final TextStyle overline = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
}
