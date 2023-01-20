import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/appearance_screen/widgets/theme_item.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(StringKeys.appearance.tr),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: SizeManager.w20, vertical: SizeManager.h20),
        children: [
          ThemeItem(
              label: StringKeys.lightMode.tr,
              mode: ThemeMode.light,
              icon: Icons.light_mode_rounded),
          ThemeItem(
              label: StringKeys.darkMode.tr,
              mode: ThemeMode.dark,
              icon: Icons.dark_mode_rounded),
          ThemeItem(
              label: StringKeys.system.tr,
              mode: ThemeMode.system,
              icon: Icons.brightness_4_rounded),
        ],
      ),
    );
  }
}
