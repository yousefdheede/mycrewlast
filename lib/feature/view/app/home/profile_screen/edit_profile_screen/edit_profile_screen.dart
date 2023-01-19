import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/widgets/profile_header.dart';
import 'package:my_crew/feature/view/widgets/app_text_form_filed.dart';
import 'package:my_crew/feature/view_model/profile_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(color: ColorManager.instance.textColorDark),
        leading: TextButton(
            onPressed: () => Get.back(),
            child: Text(
              StringKeys.cancel.tr,
              style: Theme.of(context).textTheme.headline5
          ?.copyWith(color: ColorManager.instance.textColorDark)
            )),
        title: Text(StringKeys.editProfile.tr),
        actions: [
          GetBuilder<ProfileViewModel>(
            builder: (_) {
              return TextButton(
                  onPressed: () {
                    _.updateProfile();
                  },
                  child: Text(StringKeys.save.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.w600, color: ColorManager.instance.textColorDark)));
            }
          ),
          SizedBox(
            width: SizeManager.w8,
          )
        ],
        backgroundColor: ColorManager.instance.trnasparent,
      ),
      body: GetBuilder<ProfileViewModel>(
        initState: (_){
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _.controller!.resetEditProfile();
           });
        },
        builder: (_) {
          return Form(
            key: _.formKey,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const ProfileHeader(editMode: true),
                Form(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeManager.w20, vertical: SizeManager.h20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: SizeManager.h40,
                      ),
                      AppTextFormFiled(
                          controller: _.tdFullName,
                          label: StringKeys.fullName.tr),
                      SizedBox(
                        height: SizeManager.h16,
                      ),
                      AppTextFormFiled(
                        controller: _.tdEmail,
                        label: StringKeys.email.tr,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: SizeManager.h16,
                      ),
                      AppTextFormFiled(
                          controller: _.tdPhone,
                          label: StringKeys.phoneNumber.tr),
                      SizedBox(
                        height: SizeManager.h16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
