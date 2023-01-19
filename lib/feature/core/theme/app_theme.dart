import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_crew/feature/core/theme/button_theme/app_button_theme.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/text_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/text_theme.dart';
import 'package:my_crew/utils/constants/constants.dart';


class AppTheme {
  AppTheme._();
  static AppTheme instance = AppTheme._();


    ThemeData get lightTheme {
    return ThemeData(
      // primarySwatch: ColorManager.instance.materilaColor,
      primaryColor: Colors.blueGrey,
      useMaterial3: true,
      backgroundColor: ColorManager.instance.backgroundColor,
      fontFamily: Constants.tajwal,
      scaffoldBackgroundColor: ColorManager.instance.white,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.instance.white,
          elevation: 0,
          titleTextStyle: AppTextTheme.textAppTheme.headline4
              ?.copyWith(fontWeight: FontWeight.w500),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: ColorManager.instance.textColor,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.instance.trnasparent,
              systemNavigationBarColor: ColorManager.instance.colorPrimary,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark)),
      textTheme: AppTextTheme.textAppTheme,
      // buttons
      // inputDecorationTheme: TextFieldTheme.instance.inputDecorationTheme,
      elevatedButtonTheme: AppButtonTheme.instance.elevatedButtonStyle,
      outlinedButtonTheme: AppButtonTheme.instance.outlinedButtonStyle,
      textButtonTheme: AppButtonTheme.instance.textButtonStyle,
      // textSelectionTheme: TextSelectionThemeData(
      //   cursorColor: ColorManager.instance.colorPrimary,
      // ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: SizeManager.h8, horizontal: SizeManager.w8),
        hintStyle: TextManager.headline5.copyWith(
          fontWeight: FontWeight.w500,
          color: ColorManager.instance.textColorDark,),
        labelStyle: AppTextTheme.textAppTheme.headline6?.copyWith(
            fontWeight: FontWeight.w500, color: ColorManager.instance.textColorDark),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.textColorDark)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.textColorDark)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.error)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.textColorDark)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.textColorDark)),
      ),


      tabBarTheme: TabBarTheme(
        labelColor: ColorManager.instance.backgroundColor,
        unselectedLabelColor: ColorManager.instance.textColor,
        labelStyle: TextManager.headline5.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextManager.headline5.copyWith(
            fontWeight: FontWeight.w600, color: ColorManager.instance.darkGrey),
        indicator: ShapeDecoration(
          color: ColorManager.instance.colorPrimary,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.r6),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            backgroundColor: ColorManager.instance.backgroundColor,
            unselectedLabelStyle: TextStyle(
                color: ColorManager.instance.textColor,
                fontWeight: FontWeight.w600),
            showSelectedLabels: true,
            selectedLabelStyle: TextStyle(
                color: ColorManager.instance.textColor,
                fontWeight: FontWeight.w600),
            selectedItemColor: ColorManager.instance.textColor,
            unselectedItemColor: ColorManager.instance.textColor,
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.r12)),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(ColorManager.instance.white),
        checkColor: MaterialStateProperty.all(ColorManager.instance.white),
        side: BorderSide(
            color: ColorManager.instance.white,
            width: 0.5,
            style: BorderStyle.solid),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(SizeManager.r5),
          side: BorderSide(
              color: ColorManager.instance.white,
              width: 0.5,
              style: BorderStyle.solid),
        ),
      ),

      dialogBackgroundColor: ColorManager.instance.backgroundColor,

      //fab
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorManager.instance.colorPrimary,
          foregroundColor: ColorManager.instance.textColor),
      // progress indicator
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: ColorManager.instance.colorPrimary),
      // Scaffold
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      useMaterial3: true,
      primaryColor: ColorManager.instance.colorPrimary,
      backgroundColor: ColorManager.instance.backgroundColorDark2,
      fontFamily: Constants.tajwal,
      scaffoldBackgroundColor: ColorManager.instance.backgroundColorDark,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.instance.backgroundColorDark,
          elevation: 0,
          titleTextStyle: AppTextTheme.textAppThemeDark.headline4
              ?.copyWith(fontWeight: FontWeight.w500),
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorManager.instance.white),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.instance.trnasparent,
              systemNavigationBarColor: ColorManager.instance.colorPrimary,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light)),
      textTheme: AppTextTheme.textAppThemeDark,
      // buttons
      // inputDecorationTheme: TextFieldTheme.instance.inputDecorationTheme,
      elevatedButtonTheme: AppButtonTheme.instance.elevatedButtonStyle,
      outlinedButtonTheme: AppButtonTheme.instance.outlinedButtonStyle,
      textButtonTheme: AppButtonTheme.instance.textButtonStyle,

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.instance.colorPrimary,
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextManager.headline5.copyWith(
          fontWeight: FontWeight.w500,
          color: ColorManager.instance.textColorDark,
        ),
        labelStyle: AppTextTheme.textAppTheme.headline5?.copyWith(
            fontWeight: FontWeight.w500, color: ColorManager.instance.textColorDark),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.textColorDark)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.textColorDark)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.error)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.textColorDark)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.textColorDark)),
      ),


      tabBarTheme: TabBarTheme(
        labelColor: ColorManager.instance.white,
        unselectedLabelColor: ColorManager.instance.textBodyColorDark,
        labelStyle: TextManager.headline5.copyWith(
            fontWeight: FontWeight.w600, color: ColorManager.instance.white),
        unselectedLabelStyle: TextManager.headline5.copyWith(
            fontWeight: FontWeight.w600, color: ColorManager.instance.textBodyColorDark),
        indicator: BoxDecoration(
          color: ColorManager.instance.colorPrimary,
          borderRadius: BorderRadius.circular(SizeManager.r20),
        ),
      ),

       bottomNavigationBarTheme: BottomNavigationBarThemeData(
         type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            backgroundColor: ColorManager.instance.backgroundColorDark2,
            unselectedLabelStyle: TextStyle(
                color: ColorManager.instance.white,
                fontWeight: FontWeight.w600),
            showSelectedLabels: true,
            selectedLabelStyle: TextStyle(
                color: ColorManager.instance.white,
                fontWeight: FontWeight.w600),
            selectedItemColor: ColorManager.instance.white,
            unselectedItemColor: ColorManager.instance.white,
      ),


      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.r12)),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor:
            MaterialStateProperty.all(ColorManager.instance.colorPrimary),
        side: BorderSide(
            color: ColorManager.instance.textBodyColorDark,
            width: 1.5,
            style: BorderStyle.solid),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeManager.r4),
        ),
      ),

      dialogBackgroundColor: ColorManager.instance.backgroundColorDark,
      //fab
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorManager.instance.colorPrimary,
          foregroundColor: ColorManager.instance.textColorDark),
      // progress indicator
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: ColorManager.instance.colorPrimary),
      // Scaffold
    );
  }

  
}
