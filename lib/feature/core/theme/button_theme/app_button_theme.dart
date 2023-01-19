import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';

import '../../../../utils/constants/constants.dart';



class AppButtonTheme{
  AppButtonTheme._();
  static AppButtonTheme instance = AppButtonTheme._();

  ElevatedButtonThemeData get elevatedButtonStyle => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.instance.colorPrimary,
        foregroundColor: ColorManager.instance.white,
        side: BorderSide.none,
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeManager.r16)
        ),
        minimumSize: Size(double.infinity, SizeManager.h52),
        textStyle: TextStyle(
          fontFamily: Constants.tajwal,
          color: Colors.white,
          fontSize: FontSizeManager.fontSize17,
          fontWeight: FontWeight.bold
        )
      ),);

      OutlinedButtonThemeData get outlinedButtonStyle => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
        backgroundColor: ColorManager.instance.trnasparent,
        foregroundColor: ColorManager.instance.colorPrimary,
        side: BorderSide(color: ColorManager.instance.colorPrimary, width: 0.86),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeManager.r16),
        ),
        minimumSize: Size(double.infinity, SizeManager.h52),
        textStyle: TextStyle(
          fontSize: FontSizeManager.fontSize16,
          fontFamily: Constants.tajwal,
          fontWeight: FontWeight.bold,
        )
      ),
      );


        ButtonStyle outlinedButtonTheme({Color? textColor, Color? borderColor}) => OutlinedButton.styleFrom(
        backgroundColor: ColorManager.instance.trnasparent,
        foregroundColor: ColorManager.instance.colorPrimary,
        elevation: 0,
        side: BorderSide(color: borderColor ?? ColorManager.instance.white, width: 0.5,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeManager.r16),
          side: BorderSide(color: borderColor ?? ColorManager.instance.white)
        ),
        minimumSize: Size(double.infinity, SizeManager.h52),
        textStyle: TextStyle(
          fontSize: FontSizeManager.fontSize16,
          fontFamily: Constants.tajwal,
          fontWeight: FontWeight.bold
        )
      );

      TextButtonThemeData get textButtonStyle => TextButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorManager.instance.colorPrimary,
        textStyle: TextStyle(
          color: ColorManager.instance.colorPrimary,
          fontSize: FontSizeManager.fontSize16,
          fontFamily: Constants.tajwal,
          fontWeight: FontWeight.bold
        )
      ),
      );


}