import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/company/company_profile_screen/widgets/company_info_screen/widgets/about_company.dart';
import 'package:my_crew/feature/view/app/company/company_profile_screen/widgets/company_info_screen/widgets/company_address.dart';
import 'package:my_crew/feature/view/app/company/company_profile_screen/widgets/company_info_screen/widgets/company_basic_info.dart';
import 'package:my_crew/feature/view/app/company/company_profile_screen/widgets/company_info_screen/widgets/company_contact_info.dart';
import 'package:my_crew/feature/view/app/company/company_profile_screen/widgets/company_info_screen/widgets/company_image.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/feature/view_model/company_profile_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton(), title: Text(StringKeys.companyInformation.tr),),
      body: GetBuilder<CompanyProfileViewModel>(
        builder: (_) {
          return ListView(
            padding: EdgeInsets.symmetric(vertical: SizeManager.h20, horizontal: SizeManager.w12),
            children: [
              const CompanyLogo(),
              SizedBox(height: SizeManager.h20,),
              const CompanyBasicInfo(),
              const AboutCompany(),
              const CompanyContactInfo(),
              const CompanyAddress()
            ],
          );
        }
      ),
    );
  }
}