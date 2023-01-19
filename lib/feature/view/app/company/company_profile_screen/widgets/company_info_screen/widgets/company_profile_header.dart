import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view_model/company_profile_view_model.dart';
import 'package:my_crew/utils/utils/utils.dart';

class CompanyProfileHeader extends StatelessWidget {
  const CompanyProfileHeader({
    Key? key, this.imageLink,
  }) : super(key: key);

  final String? imageLink;


  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return GetBuilder<CompanyProfileViewModel>(
      initState: (_){
        if (!Get.isRegistered<CompanyProfileViewModel>()) {
          Get.put(CompanyProfileViewModel());
        }
      },
      builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: SizeManager.w124,
            child: Container(
              margin: EdgeInsets.only(
                top: SizeManager.h20,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeManager.w3, vertical: SizeManager.h3),
              height: SizeManager.h104,
              width: SizeManager.w104,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: ColorManager.instance.colorPrimary,
                borderRadius: BorderRadius.circular(SizeManager.r24),
              ),
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(SizeManager.r22),
                  ),
                  child: _.companyLogo != null
                      ? Image.file(
                          _.companyLogo!,
                          fit: BoxFit.cover,
                        )
                      : imageLink != null ? Image.network(imageLink!) : null),
            ),
          ),
        ],
      );
    });
  }
}
