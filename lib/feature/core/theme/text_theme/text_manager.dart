import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';
import 'package:my_crew/utils/constants/constants.dart';


abstract class TextManager{

  static TextStyle get headline1 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.tajwal,
      fontWeight: FontWeight.normal,   
      fontSize: FontSizeManager.fontSize34);

  static TextStyle get headline2 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis, 
      fontFamily: Constants.tajwal,
      fontWeight: FontWeight.normal,  
      fontSize: FontSizeManager.fontSize28);

  static TextStyle get headline3 =>TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.tajwal,
      fontWeight: FontWeight.normal, 
      fontSize: FontSizeManager.fontSize24);

  static TextStyle get headline4 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.tajwal,
      fontWeight: FontWeight.normal,   
      fontSize: FontSizeManager.fontSize20);

  static TextStyle get headline5 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.tajwal,
      fontSize: FontSizeManager.fontSize16);

  static TextStyle get headline6 =>TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.tajwal,
      fontWeight: FontWeight.normal,
      fontSize: FontSizeManager.fontSize12);

  static TextStyle get subTitle1 => TextStyle(
      color: ColorManager.instance.textBodyColor,
      fontWeight: FontWeight.normal,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.tajwal,
      fontSize: FontSizeManager.fontSize17);

  static TextStyle get subtitle2 => TextStyle(
      color: ColorManager.instance.textBodyColor,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      fontFamily: Constants.tajwal,
      fontSize: FontSizeManager.fontSize12);

  static TextStyle get textBody1 =>TextStyle(
      color: ColorManager.instance.textBodyColor,
      overflow: TextOverflow.ellipsis,   
      fontWeight: FontWeight.normal,
      fontFamily: Constants.tajwal,
      fontSize: FontSizeManager.fontSize16);

  static TextStyle get textBody2 => TextStyle(
      color: ColorManager.instance.textBodyColor,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      fontFamily: Constants.tajwal,
      fontSize: FontSizeManager.fontSize14);
}