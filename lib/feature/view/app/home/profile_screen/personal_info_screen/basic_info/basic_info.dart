import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/basic_info/widgets/basic_info_item.dart';
import 'package:my_crew/utils/localization/string_keys.dart';


class BasicInfo extends StatelessWidget {
  const BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BasicInfoItem(label: StringKeys.name.tr, value: 'User Name',),
        BasicInfoItem(label: StringKeys.email.tr, value: 'example@icloud.com',),
        BasicInfoItem(label: StringKeys.phoneNumber.tr, value: '+972591234567',),
        BasicInfoItem(label: StringKeys.gender.tr, value: 'Male',),
      ],
    );
  }
}