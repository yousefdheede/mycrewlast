import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();
  static ColorManager instance = ColorManager._();

  final Color trnasparent = const Color.fromARGB(0, 255, 255, 255);
  final Color colorPrimary = const Color(0xFF5999ed);
  final Color darkGrey= const Color(0xFF9D9D9D);
  final Color white = const Color(0xFFFFFFFF);
  final Color black = const Color(0xFF000000);
  final Color textBodyColor = const Color(0xFF77808D);
  final Color textBodyColorDark = const Color.fromARGB(255, 219, 219, 219);
  final Color textColor = const Color(0xFF383838);
  final Color textColorDark = const Color(0xFFFFFFFF);
  final Color backgroundColor = const Color(0xFFF4F4F4);
  final Color backgroundColorDark = const Color(0xFF1B2430);
  final Color backgroundColorDark2 = const Color.fromARGB(255, 31, 40, 53);
  final Color error = const Color(0xFFF44336);
  final Color success = const Color(0xFF5cb85c);
  final Color lightGrey = const Color(0xFFEFEFF4);


  final materilaColor = MaterialColor(const Color(0xFF5999ed).value, {
    100 : const Color(0xFF5999ed).withOpacity(0.1),
    200 : const Color(0xFF5999ed).withOpacity(0.2),
    300 : const Color(0xFF5999ed).withOpacity(0.3),
    400 : const Color(0xFF5999ed).withOpacity(0.4),
    500 : const Color(0xFF5999ed).withOpacity(0.5),
    600 : const Color(0xFF5999ed).withOpacity(0.6),
    700 : const Color(0xFF5999ed).withOpacity(0.7),
    800 : const Color(0xFF5999ed).withOpacity(0.8),
    900 : const Color(0xFF5999ed).withOpacity(0.9),
  });


}