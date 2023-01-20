
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/asset/asset_manager.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/on_boarding/on_boarding_screen.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    _navigate();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage(AppImages.splashBackground),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          ColorManager.instance.textColor,
                          BlendMode.multiply))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeManager.w20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    StringKeys.appName.tr,
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorManager.instance.textColorDark),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: SizeManager.h4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: SizeManager.w44),
                    child: Text(
                      StringKeys.onBoardingBody3.tr,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: ColorManager.instance.textBodyColorDark,
                          fontWeight: FontWeight.w500),
                      maxLines: 3,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            )
          ],
        ));
  }

  void _navigate() {
    Future.delayed(const Duration(milliseconds: 3000), () {

      // if (false) {
      //   if (Utils.instance.isTouristAccount() &&
      //       SharedPrefs.instance.getUserData().preferredActivity == null) {
      //     Get.off(() => const PreferencesScreen());
      //   } else {
      //     Get.off(() => const HomePlaceholderScreen());
      //   }
      // } else {
      //   if (true) {
          // Get.off(() => const HomePlaceholderScreen());
          Get.off(() => const OnBoardingScreen());
    //     } else {
    //       Get.off(() => const ChooseAccountTypeScreen());
    //     }
    //   }
    });
  }
}
