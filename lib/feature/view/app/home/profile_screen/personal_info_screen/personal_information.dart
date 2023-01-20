import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/address/address.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/basic_info/basic_info.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/bio/bio.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/education/education.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/resume/resume.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/skills/skills.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/widgets/profile_image.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/widgets/profile_info_section.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/feature/view_model/profile_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(color: ColorManager.instance.textColorDark),
        leading: const AppBackButton(),
        title: Text(StringKeys.presonalInformation.tr),
      ),
      body: GetBuilder<ProfileViewModel>(
        initState: (_){
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _.controller!.resetEditProfile();
           });
        },
        builder: (_) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: SizeManager.w12, vertical: SizeManager.h12),
            children:  [
               const ProfileImage(),
              ProfileInfoSection(label: StringKeys.basicInformation.tr, onPressed: (){}, content: const BasicInfo()),
              ProfileInfoSection(label: StringKeys.bio.tr, onPressed: (){}, content: const Bio()),
              ProfileInfoSection(label: StringKeys.address.tr, onPressed: (){}, content: const Address()),
              ProfileInfoSection(label: StringKeys.education.tr, onPressed: (){}, content: const Education()),
              ProfileInfoSection(label: StringKeys.skills.tr, onPressed: (){}, content: const Skills()),
              ProfileInfoSection(label: StringKeys.myResume.tr, onPressed: (){}, content: const Resume()),
            ],
          );
        },
      ),
    );
  }
}