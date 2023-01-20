import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/feature/view/app/widgets/choose_image_bottom_sheet.dart';
import 'package:my_crew/feature/view_model/profile_view_model.dart';
import 'package:my_crew/utils/utils/utils.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    this.editMode = false,
  }) : super(key: key);

  final bool editMode;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return GetBuilder<ProfileViewModel>(builder: (_) {
      return Stack(
        children: [
          Container(
              width: Get.width,
              height: SizeManager.h200,
              decoration: ShapeDecoration(
                  color: ColorManager.instance.colorPrimary,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(200),
                  )))),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(
                        top: SizeManager.h74, start: SizeManager.w40),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeManager.w4, vertical: SizeManager.h4),
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
                      child: _.profileImage != null && editMode
                          ? Image.file(
                              _.profileImage!,
                              fit: BoxFit.cover,
                            )
                          : const AppImageNetwork(),
                    ),
                  ),
                  Visibility(
                    visible: editMode,
                    child: Container(
                        margin: EdgeInsetsDirectional.only(
                            end: SizeManager.w12, bottom: SizeManager.h6),
                        width: SizeManager.w32,
                        height: SizeManager.h32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        child: IconButton(
                            onPressed: () {
                              Get.bottomSheet(
                                  ChooseImageBottomSheet(onCameraPressed: () {
                                    Get.back();
                                    _.pickImage(
                                        imageSource: ImageSource.camera);
                                  }, onGalleryPressed: () {
                                    Get.back();
                                    _.pickImage(
                                        imageSource: ImageSource.gallery);
                                  }),
                                  isScrollControlled: true);
                            },
                            color: ColorManager.instance.colorPrimary,
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              size: SizeManager.r16,
                            ))),
                  )
                ],
              ),
              SizedBox(
                width: SizeManager.w20,
              ),
              Visibility(
                visible: !editMode,
                child: Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      /* SharedPrefs.instance.getUserData().name ?? */ 'Yousef',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorManager.instance.textColorDark),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      /* SharedPrefs.instance.getUserData().email ?? */ 'dheede.2000@gmail.com',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: ColorManager.instance.textBodyColorDark),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: SizeManager.h28,
                    )
                  ],
                )),
              ),
            ],
          )
        ],
      );
    });
  }
}
