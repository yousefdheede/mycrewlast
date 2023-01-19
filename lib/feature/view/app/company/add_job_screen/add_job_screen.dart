import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/feature/view/widgets/app_text_form_filed.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

import '../../../../back/db_helper.dart';
import '../../../../model/job_model.dart';
import '../compay_home_screen/company_home_screen.dart';

class AddJobScreen extends StatelessWidget {
  AddJobScreen({super.key, this.isUpdate = false});

  final bool isUpdate;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(isUpdate ? StringKeys.editJob.tr : StringKeys.addNewJob.tr),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: SizeManager.w12, vertical: SizeManager.h20),
        children: [
          AppTextFormFiled(controller: txt1, label: StringKeys.jobTitle.tr),
          SizedBox(
            height: SizeManager.h16,
          ),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: AppTextFormFiled(
                      controller: txt2, label: StringKeys.jobType.tr)),
              SizedBox(
                width: SizeManager.w16,
              ),
              Expanded(
                  flex: 2,
                  child: AppTextFormFiled(
                      controller: txt3, label: StringKeys.salary.tr)),
            ],
          ),
          SizedBox(
            height: SizeManager.h16,
          ),
          AppTextFormFiled(
            controller: txt4,
            label: StringKeys.jobDescription.tr,
            maxLines: 4,
          ),
          SizedBox(
            height: SizeManager.h24,
          ),
          ElevatedButton(
              onPressed: () {
                JobModel jobmodel = JobModel(
                    job_title: txt1.text,
                    job_type: txt2.text,
                    salary: txt3.text,
                    job_Description: txt4.text);
                DbHelper.dbHelper.insertNewJob(jobmodel);
                //DbHelper.dbHelper.getAlljobs();
                //print(jobmodel);
                Get.offAll(() => const CompanyHomeScreen());
              },
              child: Text(isUpdate ? StringKeys.save.tr : StringKeys.add.tr))
        ],
      ),
    );
  }
}
