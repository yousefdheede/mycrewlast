import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/text_manager.dart';


abstract class AppTextTheme{


    static TextTheme textAppTheme = TextTheme(
        headline1: TextManager.headline1,
        headline2: TextManager.headline2,
        headline3: TextManager.headline3,
        headline4: TextManager.headline4,
        headline5: TextManager.headline5,
        headline6: TextManager.headline6,
        subtitle1: TextManager.subTitle1,
        subtitle2: TextManager.subtitle2,
        bodyText1: TextManager.textBody1,
        bodyText2: TextManager.textBody2,
      );

       static TextTheme textAppThemeDark = TextTheme(
        headline1: TextManager.headline1.copyWith(color: ColorManager.instance.textColorDark),
        headline2: TextManager.headline2.copyWith(color: ColorManager.instance.textColorDark),
        headline3: TextManager.headline3.copyWith(color: ColorManager.instance.textColorDark),
        headline4: TextManager.headline4.copyWith(color: ColorManager.instance.textColorDark),
        headline5: TextManager.headline5.copyWith(color: ColorManager.instance.textColorDark),
        headline6: TextManager.headline6.copyWith(color: ColorManager.instance.textColorDark),
        subtitle1: TextManager.subTitle1.copyWith(color: ColorManager.instance.textBodyColorDark),
        subtitle2: TextManager.subtitle2.copyWith(color: ColorManager.instance.textBodyColorDark),
        bodyText1: TextManager.textBody1.copyWith(color: ColorManager.instance.textBodyColorDark),
        bodyText2: TextManager.textBody2.copyWith(color: ColorManager.instance.textBodyColorDark),
      );
}