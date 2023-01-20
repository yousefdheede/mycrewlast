import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/widgets/profile_header.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/widgets/profile_settings.dart';
import 'package:my_crew/feature/view_model/profile_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorManager.instance.trnasparent,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                StringKeys.edit.tr,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorManager.instance.textColorDark),
              ))
        ],
      ),
      body: GetBuilder<ProfileViewModel>(initState: (_) {
        if (!Get.isRegistered<ProfileViewModel>()) {
          Get.put(ProfileViewModel(), permanent: true);
        }
      }, builder: (_) {
        return ListView(
          padding: EdgeInsets.only(top: 0, bottom: SizeManager.h52),
          children: [
            const ProfileHeader(),
            SizedBox(
              height: SizeManager.h80,
            ),
            const ProfileSettings(),
          ],
        );
      }),
    );
  }
}
