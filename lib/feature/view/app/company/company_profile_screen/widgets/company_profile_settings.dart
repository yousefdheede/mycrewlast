
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/chat/my_chats_screen/my_chats_screen.dart';
import 'package:my_crew/feature/view/app/company/company_profile_screen/widgets/company_info_screen/company_info_screen.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/appearance_screen/appearance_screen.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/languages_screen/languages_screen.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/widgets/profile_setting_item.dart';
import 'package:my_crew/feature/view_model/company_profile_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';


class CompanyProfileSettings extends StatelessWidget {
  const CompanyProfileSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return GetBuilder<CompanyProfileViewModel>(
      builder: (_) {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: SizeManager.w20, vertical: SizeManager.h20),
          children: [
            ProfileSettingsItem(
              icon: Icons.business_rounded,
              label: StringKeys.companyInformation.tr,
              onPressed: () {
                Get.to(()=> const CompanyInfoScreen());
              },
            ),
            ProfileSettingsItem(
              icon: Icons.chat_rounded,
              label: StringKeys.chats.tr,
              onPressed: () {
                Get.to(()=> const MyChatsScreen());  
              },
            ),
            ProfileSettingsItem(
              icon: Icons.dark_mode_rounded,
              label: StringKeys.appearance.tr,
               subTitle: Utils.instance.getCurrentThemeName(),
              onPressed: () {
                Get.to(()=> const AppearanceScreen());
              },
            ),
            ProfileSettingsItem(
              icon: Icons.translate_rounded,
              label: StringKeys.language.tr,
              subTitle: StringKeys.english.tr,
              onPressed: () {
                Get.to(()=> const LanguagesScreen());
              },
            ),
            ProfileSettingsItem(
              icon: Icons.logout_rounded,
              label: StringKeys.logout.tr,
              onPressed: () {
                _.logout();
              },
              hasNextScreen: false,
            ),
          ],
        );
      }
    );
  }
}
