import 'package:flutter/material.dart';

class AppColors {
  // add a private constructor to prevent this class being instantiated
  // e.g. invoke `AppColors()` accidentally
  AppColors._();

  // the properties are static so that we can use them without a class instance
  // e.g. can be retrieved by `LocalStorageKey.saveUserId`.
  static const Color mainColor = Color(0xFF003777);
  static const Color backgroundColor = Color(0xFFFCFEFF);
  static const Color defaultColor = Color(0xFF212121);
  static const Color greyColor = Color(0xff6d6d6d);
  static const Color offWhiteGreyColor = Color(0xFFC1C1C1);
  static const Color whiteGreyColor = Color(0xFF5f5f5f);
  static const Color avatarWhiteColor = Color(0xFFF7F7F7);
  static const Color redColor = Color(0xFFE9132F);
  static const Color yellowColor = Color(0xFFFFA115);
  static const Color greenColor = Color(0xff00ed51);

  static const MaterialColor materialMainColor = MaterialColor(
    _mainColorValue,
    <int, Color>{
      50: Color(0xFFE8EAF6),
      100: Color(0xFFC5CAE9),
      200: Color(0xFF9FA8DA),
      300: Color(0xFF7986CB),
      400: Color(0xFF5C6BC0),
      500: Color(_mainColorValue),
      600: Color(0xFF3949AB),
      700: Color(0xFF303F9F),
      800: Color(0xFF283593),
      900: Color(0xFF1A237E),
    },
  );
  static const int _mainColorValue = 0xFF003777;
}
