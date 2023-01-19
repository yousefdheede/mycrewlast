import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/job_model.dart';
import 'package:my_crew/feature/view/app/home/home_screen/widgets/job_item.dart';
import 'package:my_crew/feature/view/app/home/jobs_screen/jobs_screen.dart';
import 'package:my_crew/feature/view/app/widgets/list_label.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class JobsList extends StatelessWidget {
  final joblist = jobdata.joblist();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeManager.w12),
          child: ListLabel(
              label: StringKeys.jobsCapital.tr,
              onPressed: () {
                Get.to(() => JobsScreen());
              }),
        ),
        SizedBox(
          height: SizeManager.h4,
        ),
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: SizeManager.w12),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => JobItem(joblist[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: SizeManager.h8,
          ),
        ),
      ],
    );
  }
}
