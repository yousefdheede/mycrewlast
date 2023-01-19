import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/company/job_applicants_screen/widgets/job_applicant_item.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class JobApplicantsScreen extends StatelessWidget {
  const JobApplicantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton(), title: Text(StringKeys.jobApplicants.tr),),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: SizeManager.w12, vertical: SizeManager.h12),
        itemCount: 3, itemBuilder: (context, index) => const JobApplicantItem(), separatorBuilder:(context, index) => SizedBox(height: SizeManager.h12),),
    );
  }
}