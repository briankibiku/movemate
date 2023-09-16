import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xff493391),
    primaryColorLight: const Color(0xFFF37A1F),
  );
}

class AppTextStyles {
  static const TextStyle mainHeadingTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Color(0xFF0f1c39),
  );
  static const TextStyle sublteHeadingTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );
  static const TextStyle subHeadingTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
  );
  static const TextStyle metaDataTextStyle =
      TextStyle(fontSize: 12, color: Colors.grey);
  static const TextStyle metaTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.grey);
  static const TextStyle normalTextStyle = TextStyle(fontSize: 14);
}
