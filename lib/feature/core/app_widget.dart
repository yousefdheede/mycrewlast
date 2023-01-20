import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/app_theme.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/view/splash/splash_screen.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/utils/utils.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeViewModel.navigateToHomeScreen();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          ColorManager.instance.colorPrimary, // navigation bar color
      statusBarColor: ColorManager.instance.trnasparent, // status bar color
    ));

    return ScreenUtilInit(
      designSize:Constants.debugBeviceSize,
      builder: (context, widget) => GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.keepFactory,
      theme: AppTheme.instance.lightTheme,
      darkTheme: AppTheme.instance.darkTheme,
      themeMode: Utils.instance.getThemeMode(),
      home: const SplashScreen(),
      locale: const Locale(Constants.enLangCode),
      ),
    );
  }
}
