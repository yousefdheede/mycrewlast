import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view_model/profile_view_model.dart';
import 'package:my_crew/utils/utils/utils.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    Key? key,
    required this.label,
    required this.langCode,
  }) : super(key: key);

  final String label;
  final String langCode;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return GetBuilder<ProfileViewModel>(
      initState: (_){
        if (!Get.isRegistered<ProfileViewModel>()) {
          Get.put(ProfileViewModel());
        }
      },
      builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: SizeManager.h4),
          child: ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeManager.r8)),
            leading: Container(
              width: SizeManager.w40,
              height: SizeManager.h40,
              decoration: BoxDecoration(
                  color: ColorManager.instance.colorPrimary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(SizeManager.r8)),
              child: Icon(
                Icons.language_rounded,
                color: ColorManager.instance.colorPrimary,
              ),
            ),
            title: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            tileColor: Theme.of(context).backgroundColor,
            trailing: Visibility(
                visible: Get.locale?.languageCode == langCode,
                child: Icon(Icons.check_circle_outline_rounded,
                  color: ColorManager.instance.colorPrimary
                )),
          ),
        );
      }
    );
  }
}