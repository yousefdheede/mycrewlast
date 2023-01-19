import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/view/widgets/progress_dialog.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/shared/shared_prefs.dart';


class Utils {
  Utils._();

  static Utils instance = Utils._();

  mainSnack({String? title, required String body, Color? backgroundColor}) {
    Get.showSnackbar( 
      GetSnackBar(
        backgroundColor: backgroundColor ?? const Color(0xFF303030),
        duration: const Duration(seconds: 2),
        borderRadius: 10,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        messageText: Text(body, maxLines: 2,),
      ),
    );
  }

  screenUtil({required BuildContext context}) {
    ScreenUtil.init(
      context,
      minTextAdapt: true,
      designSize: Constants.debugBeviceSize
    );
  }

  snackSuccess({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManager.instance.success);
  }

  snackError({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManager.instance.error);
  }

  BouncingScrollPhysics getIosScroll() {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }

    void showAlertDialog({required String title, required String body, required String positiveButtonText, required void Function() positiveButtonOnPressed, String? negativeButtonText, void Function()? negativeButtonOnPressed, bool isDanger = false}){
    Get.dialog(AlertDialog(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      title: Text(title, textAlign: TextAlign.start, style: Theme.of(Get.context!).textTheme.headline4, ),
      content: Text(body, textAlign: TextAlign.start, style: Theme.of(Get.context!).textTheme.bodyText1, maxLines: 5,),
      actionsAlignment: MainAxisAlignment.start,
      actions: [
        TextButton(onPressed: positiveButtonOnPressed, style: isDanger ? TextButton.styleFrom(foregroundColor: ColorManager.instance.error) : null , child: Text(positiveButtonText)),
        Visibility(
          visible: negativeButtonOnPressed != null && negativeButtonText != null,
          child: TextButton(onPressed: negativeButtonOnPressed, style: TextButton.styleFrom(foregroundColor: ColorManager.instance.textBodyColor), child: Text(negativeButtonText ?? ''))),
        ],
    ));
  }

  void changeDeviceOrientation({required DeviceOrientation orientation}){
       SystemChrome.setPreferredOrientations([orientation]);
  }

  bool isArabic() {
    return Get.locale?.languageCode == Constants.arLangCode;
  }


  void showProgressDialog(){
    Get.dialog(const ProgressDialog(), barrierDismissible: false);
  }

  void hideProgressDialog(){
    Get.back();
  }

  //   String getDateFormatted({DateTime? dateTime, String? format}) {
  //   var formatter = DateFormat(format ?? 'E - dd MMM yyyy');
  //   return formatter.format(dateTime ?? DateTime.now());
  // }

  ThemeMode getThemeMode(){
    if (SharedPrefs.instance.getTheme() == ThemeMode.light.name) {
       return ThemeMode.light;
    }else if(SharedPrefs.instance.getTheme() == ThemeMode.dark.name){
      return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

      String getCurrentThemeName(){
    if (SharedPrefs.instance.getTheme() == ThemeMode.light.name) {
       return StringKeys.lightMode.tr;
    }else if(SharedPrefs.instance.getTheme() == ThemeMode.dark.name){
      return StringKeys.darkMode.tr;
    }
    return StringKeys.system.tr;
  }
}
