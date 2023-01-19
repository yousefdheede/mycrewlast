import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/widgets/profile_info_section.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class AboutCompany extends StatelessWidget {
  const AboutCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileInfoSection(
        label: StringKeys.aboutCompany.tr,
        onPressed: (){},
        content: const Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as',
            maxLines: 30,));
  }
}
