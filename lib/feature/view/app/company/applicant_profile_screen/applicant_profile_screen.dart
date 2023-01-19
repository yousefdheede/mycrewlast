import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/user_model.dart';
import 'package:my_crew/feature/view/app/chat/chat_screen/chat_screen.dart';
import 'package:my_crew/feature/view/app/company/applicant_profile_screen/widgets/address/applicant_address.dart';
import 'package:my_crew/feature/view/app/company/applicant_profile_screen/widgets/applicant_profile_image.dart';
import 'package:my_crew/feature/view/app/company/applicant_profile_screen/widgets/bio/applicant_bio.dart';
import 'package:my_crew/feature/view/app/company/applicant_profile_screen/widgets/education/applicant_education.dart';
import 'package:my_crew/feature/view/app/company/applicant_profile_screen/widgets/skills/applicant_skills.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/widgets/profile_info_section.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ApplicantProfileScreen extends StatelessWidget {
  const ApplicantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Applicant name'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeManager.w12, vertical: SizeManager.h20),
              children: [
                const ApplicantProfileImage(),
                SizedBox(
                  height: SizeManager.h16,
                ),
                Text(
                  'Applicant name',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(SizeManager.r8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeManager.w8, vertical: SizeManager.h3),
                      child: Text(
                        'applicant@gmail.com',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorManager.instance.colorPrimary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeManager.h4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        launchUrlString('mailto: anawajha@icloud.com');
                      },
                      icon: const Icon(Icons.email_rounded),
                      color: ColorManager.instance.colorPrimary,
                    ),
                    SizedBox(
                      width: SizeManager.w8,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => ChatScreen(
                            recpient:
                                UserModel(client_name: 'Applicant name')));
                      },
                      icon: const Icon(Icons.message_rounded),
                      color: ColorManager.instance.colorPrimary,
                    ),
                    SizedBox(
                      width: SizeManager.w8,
                    ),
                    IconButton(
                      onPressed: () {
                        launchUrlString("tel://+972592686823");
                      },
                      icon: const Icon(Icons.phone_rounded),
                      color: ColorManager.instance.colorPrimary,
                    ),
                  ],
                ),
                ProfileInfoSection(
                    label: StringKeys.bio.tr,
                    hasButton: false,
                    content: const ApplicantBio()),
                ProfileInfoSection(
                    label: StringKeys.education.tr,
                    hasButton: false,
                    content: const ApplicantEducation()),
                ProfileInfoSection(
                    label: StringKeys.skills.tr,
                    hasButton: false,
                    content: const ApplicantSkills()),
                ProfileInfoSection(
                    label: StringKeys.address,
                    hasButton: false,
                    content: const ApplicantAddress()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeManager.h16, horizontal: SizeManager.w12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: SizedBox(
                        height: SizeManager.h36,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(SizeManager.r12))),
                          child: Text(StringKeys.accept.tr),
                        ))),
                SizedBox(
                  width: SizeManager.w16,
                ),
                Expanded(
                    child: SizedBox(
                        height: SizeManager.h36,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.color
                                  ?.withOpacity(0.25),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(SizeManager.r12))),
                          child: Text(StringKeys.reject.tr),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
