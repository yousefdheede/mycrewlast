import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view_model/home_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';


class HomePlaceholderScreen extends StatelessWidget {
  const HomePlaceholderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        initState: (_) {
          if (!Get.isRegistered<HomeViewModel>()) {
            Get.put(HomeViewModel(), permanent: true);
          } else {
            Get.find<HomeViewModel>();
          }
        },
        builder: (_) {
          return _.screens[_.bottomNavSelectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<HomeViewModel>(builder: (_) {
        return BottomNavigationBar(
            onTap: (index) => _.changeBottomNavIndex(index: index),
            currentIndex: _.bottomNavSelectedIndex,
            items: [
              appBottomNavIBartem( context: context,
                  icon: Icons.home_rounded, label: StringKeys.home.tr),
                appBottomNavIBartem( context: context,
                    icon: Icons.bookmark_rounded,
                    label: StringKeys.favorites.tr),       
              appBottomNavIBartem( context: context,
                  icon: Icons.notifications_rounded,
                  label: StringKeys.notifications.tr),
              appBottomNavIBartem( context: context,
                  icon: Icons.person_rounded, label: StringKeys.profile.tr),
            ]);
      }),
    );
  }

  BottomNavigationBarItem appBottomNavIBartem(
          {required BuildContext context, required IconData icon, required String label}) =>
      BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: SizeManager.h4),
            child: Icon(icon,
                color: Theme.of(context).textTheme.headline1?.color),
          ),
          activeIcon: Container(
              margin: EdgeInsets.only(bottom: SizeManager.h4),
              height: SizeManager.h28,
              width: SizeManager.w44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeManager.r16),
                color: ColorManager.instance.colorPrimary,
              ),
              child: Icon(icon,
                  color: Theme.of(context).textTheme.headline1?.color)),
          label: label);
}
