import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/view/app/home/company_screen/widgets/contact_item.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/widgets/profile_info_section.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class CompanyContactInfo extends StatelessWidget {
  const CompanyContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileInfoSection(label: StringKeys.contactAndSocialMedia, content:  Column(
      children: [
        ContactItem(title: StringKeys.email.tr, subTitle: 'example@icloud.com', icon: const Icon(Icons.email_rounded)),
        ContactItem(title: StringKeys.phoneNumber.tr, subTitle: '+972591234567', icon: const Icon(Icons.email_rounded)),
        ContactItem(title: StringKeys.facebook.tr, subTitle: 'Company Name', icon: const Icon(Icons.email_rounded)),
        ContactItem(title: StringKeys.website.tr, subTitle: 'www.companydomain.com', icon: const Icon(Icons.email_rounded)),
        ContactItem(title: StringKeys.snapchat.tr, subTitle: 'companyName', icon: const Icon(Icons.email_rounded)),
      ],
    ),);
  }
}