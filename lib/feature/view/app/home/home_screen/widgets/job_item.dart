import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/job_model.dart';
import 'package:my_crew/feature/view/app/home/job_details_screen/job_details_screen.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class JobItem extends StatelessWidget {
  late final jobdata jo;
  JobItem(this.jo);
  final joblist = jobdata.joblist();
  @override
  Widget build(BuildContext context) {
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
                    jo.job_title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    jo.salary,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.bookmark_outline_rounded,
                    color: ColorManager.instance.colorPrimary,
                  ),
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
                          jo.jobdate,
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                    Text(
                      jo.job_type,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
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
                          var index;
                          Get.to(() => (context, index) =>
                              JobDetailsScreen(joblist[index]));
                          //Get.to(() => JobDetailsScreen(joblist[index]);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeManager.w8,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeManager.r12))),
                        child: Text(StringKeys.apply.tr),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
