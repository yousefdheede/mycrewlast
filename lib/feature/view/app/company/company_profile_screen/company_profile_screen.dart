import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/company/company_profile_screen/widgets/company_profile_settings.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

import 'widgets/company_info_screen/widgets/company_profile_header.dart';

class CompanyProfileScreen extends StatelessWidget {
  const CompanyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton(), title: Text(StringKeys.companyProfile.tr),),
      body: ListView(
        children: [
          const CompanyProfileHeader(),
          SizedBox(height: SizeManager.h48,),
          const CompanyProfileSettings()
        ],
      ),
    );
  }
}