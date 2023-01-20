import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/basic_info/widgets/basic_info_item.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/widgets/profile_info_section.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class CompanyBasicInfo extends StatelessWidget {
  const CompanyBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileInfoSection(
      label: StringKeys.basicInformation,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicInfoItem(label: StringKeys.companyName.tr, value: 'Company name'),
          BasicInfoItem(label: StringKeys.email.tr, value: 'example@icloud.com'),
          BasicInfoItem(label: StringKeys.address.tr, value: 'Str1 - Nablus - Palestine'),
        ],
      ),
    );
  }
}