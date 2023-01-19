import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/feature/view/app/widgets/choose_image_bottom_sheet.dart';
import 'package:my_crew/feature/view_model/profile_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(builder: (_) {
      return Column(
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(top: SizeManager.h8),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeManager.w3, vertical: SizeManager.h3),
              height: SizeManager.h104,
              width: SizeManager.w104,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: ColorManager.instance.colorPrimary,
                  shape: BoxShape.circle),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeManager.w2, vertical: SizeManager.h2),
                height: SizeManager.h124,
                width: SizeManager.w124,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: ColorManager.instance.colorPrimary,
                      shape: BoxShape.circle),
                  child: _.profileImage != null
                      ? Image.file(
                          _.profileImage!,
                          fit: BoxFit.cover,
                        )
                      : const AppImageNetwork(),
                ),
              )),
          SizedBox(
            height: SizeManager.h4,
          ),
          SizedBox(
            height: SizeManager.h34,
            width: SizeManager.w124,
            child: TextButton(
                onPressed: () {
                   _.profileImage != null ? _.saveUserAvatar() :  Get.bottomSheet(
                                  ChooseImageBottomSheet(onCameraPressed: () {
                                    Get.back();
                                    _.pickImage(imageSource: ImageSource.camera);
                                  }, onGalleryPressed: () {
                                    Get.back();
                                    _.pickImage(imageSource: ImageSource.gallery);
                                  }),
                                  isScrollControlled: true);
                },
                child: Text(
                  _.profileImage != null ? StringKeys.save.tr : StringKeys.changeAvatar.tr,
                  style: TextStyle(fontSize: FontSizeManager.fontSize14),
                )),
          ),
        ],
      );
    });
  }
}
