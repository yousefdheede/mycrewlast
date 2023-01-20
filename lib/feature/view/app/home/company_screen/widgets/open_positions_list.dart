import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/job_model.dart';
import 'package:my_crew/feature/view/app/home/company_screen/company_positions_screen.dart';
import 'package:my_crew/feature/view/app/home/home_screen/widgets/job_item.dart';
import 'package:my_crew/feature/view/app/widgets/list_label.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class OpenPositionsList extends StatelessWidget {
  final joblist = jobdata.joblist();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListLabel(
          label: StringKeys.openPositions.tr,
          onPressed: () {
            Get.to(() => CompanyPositionsScreen());
          },
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
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
