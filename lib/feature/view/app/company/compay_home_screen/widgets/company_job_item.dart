import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/job_model.dart';
import 'package:my_crew/feature/view/app/company/Job_applicants_screen/Job_applicants_screen.dart';
import 'package:my_crew/feature/view/app/company/add_job_screen/add_job_screen.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class CompanyJobItem extends StatelessWidget {
  const CompanyJobItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    JobModel jobmodel = JobModel();
    return Material(
        borderRadius: BorderRadius.circular(SizeManager.r12),
        color: Theme.of(context).backgroundColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(SizeManager.r12),
          child: Container(
            padding: EdgeInsets.only(
              left: SizeManager.w16,
              right: SizeManager.w16,
              bottom: SizeManager.h16,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    jobmodel.job_title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    jobmodel.salary ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: PopupMenuButton(
                      onSelected: (value) {
                        switch (value) {
                          case 0:
                            Get.to(() => AddJobScreen(
                                  isUpdate: true,
                                ));
                            break;
                          case 1:
                            Utils.instance.showAlertDialog(
                                title: StringKeys.deleteJob.tr,
                                body: StringKeys
                                    .areYouSureYouWantToDeleteThisJob.tr,
                                positiveButtonText: StringKeys.delete.tr,
                                positiveButtonOnPressed: () => Get.back(),
                                negativeButtonText: StringKeys.cancel.tr,
                                negativeButtonOnPressed: () => Get.back(),
                                isDanger: true);
                            break;
                          default:
                        }
                      },
                      color: Theme.of(context).scaffoldBackgroundColor,
                      icon: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).textTheme.headline1?.color,
                      ),
                      itemBuilder: (context) => [
                            PopupMenuItem<int>(
                                value: 0,
                                child: Row(children: [
                                  const Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: SizeManager.w8,
                                  ),
                                  Text(StringKeys.edit.tr)
                                ])),
                            PopupMenuItem<int>(
                                value: 1,
                                child: Row(children: [
                                  Icon(
                                    Icons.delete,
                                    color: ColorManager.instance.error,
                                  ),
                                  SizedBox(
                                    width: SizeManager.w8,
                                  ),
                                  Text(StringKeys.delete.tr)
                                ])),
                          ]),
                  contentPadding: EdgeInsets.zero,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: SizeManager.r16,
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                        SizedBox(
                          width: SizeManager.w4,
                        ),
                        Text(
                          '15/12/2022',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                    Text(
                      jobmodel.job_type ?? '',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    //PersonalInformationScreen();

                    Text(
                      'Open',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.success),
                    ),
                    SizedBox(
                      width: SizeManager.w68,
                      height: SizeManager.h36,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const JobApplicantsScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeManager.w8,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(SizeManager.r12))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [Text('55'), Icon(Icons.person)],
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
