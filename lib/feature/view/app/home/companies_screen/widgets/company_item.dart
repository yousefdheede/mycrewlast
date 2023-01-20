import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/company_model.dart';
import 'package:my_crew/feature/view/app/home/company_screen/company_screen.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class CompanyItem extends StatelessWidget {
  late final comdata com;
  CompanyItem(this.com);

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(SizeManager.r12),
        color: Theme.of(context).backgroundColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(SizeManager.r12),
          onTap: () {
            Get.to(() => CompanyScreen());
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Get.width * 0.3,
                width: Get.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeManager.r12),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppImageNetwork(
                        url: com.imageUrl,
                        width: Get.width * 0.15,
                        height: Get.width * 0.15,
                        radius: SizeManager.r8,
                      ),
                      SizedBox(
                        height: SizeManager.h4,
                      ),
                      Text(com.name,
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(
                        com.jobs,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color:
                                Theme.of(context).textTheme.bodyText2?.color),
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}
