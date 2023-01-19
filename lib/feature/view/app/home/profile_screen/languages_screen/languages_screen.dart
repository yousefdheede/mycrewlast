import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/languages_screen/widgets/language_item.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(StringKeys.language.tr),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: SizeManager.w20, vertical: SizeManager.h20),
        children: [
          LanguageItem(
              label: StringKeys.arabic.tr, langCode: Constants.arLangCode),
          LanguageItem(
              label: StringKeys.english.tr, langCode: Constants.enLangCode),
        ],
      ),
    );
  }
}
