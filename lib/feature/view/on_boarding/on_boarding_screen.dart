import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/on_boarding/widgets/on_boarding_controllers.dart';
import 'package:my_crew/feature/view/on_boarding/widgets/on_boarding_indcators.dart';
import 'package:my_crew/feature/view/on_boarding/widgets/on_boarding_item.dart';
import 'package:my_crew/feature/view_model/auth_view_model.dart';
import 'package:my_crew/utils/shared/shared_prefs.dart';
import 'package:my_crew/utils/utils/utils.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GetBuilder<AuthViewModel>(initState: (_) {
            if (!Get.isRegistered<AuthViewModel>()) {
              Get.put(AuthViewModel(), permanent: true);
            }
            SharedPrefs.instance.setIsFirsOpen();
          }, builder: (_) {
            return PageView.builder(
                controller: _.pageController,
                onPageChanged: (pageIndex) {
                  _.changeOnBoardingPage(pageIndex: pageIndex);
                },
                itemCount: _.titles.length,
                itemBuilder: (context, index) => OnBoardingItem(
                      imagePath: _.images[index],
                      title: _.titles[index],
                      body: _.bodys[index],
                    ));
          })),
          SizedBox(
            height: SizeManager.h80,
          ),
          const OnBoardingIndicators(),
          SizedBox(
            height: SizeManager.h32,
          ),
          const OnBoardingControllers()
        ],
      ),
    );
  }
}
