import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';


class ChooseImageBottomSheet extends StatelessWidget {
  const ChooseImageBottomSheet({ 
    Key? key, required this.onCameraPressed, required this.onGalleryPressed,
  }) : super(key: key);

  final void Function() onCameraPressed;
  final void Function() onGalleryPressed;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return  Container(
          padding: EdgeInsets.only(
            top: SizeManager.h8,
          ),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(SizeManager.r24))),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: SizeManager.w80,
              height: SizeManager.h4,
              decoration: BoxDecoration(
                  color: Theme.of(context).textTheme.bodyText1?.color,
                  borderRadius: BorderRadius.circular(SizeManager.r4)),
            ),
            SizedBox(
              height: SizeManager.h40,
              width: Get.width,
            ),
            InkWell(
                onTap: onCameraPressed,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeManager.h20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_rounded, color: Theme.of(context).textTheme.headline1?.color,),
                      SizedBox(width: SizeManager.w16,),
                      Text(
                        StringKeys.camera.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )),
            InkWell(
                onTap: onGalleryPressed,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeManager.h20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_rounded, color: Theme.of(context).textTheme.headline1?.color,),
                      SizedBox(width: SizeManager.w16,),
                      Text(StringKeys.gallery.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                )),
            SizedBox(
              height: SizeManager.h20,
            ),
            Container(
              width: Get.width,
              height: SizeManager.h60,
              alignment: Alignment.center,
              color: ColorManager.instance.colorPrimary,
              child: Text(StringKeys.chooseImageFrom.tr,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.w500, color: ColorManager.instance.textColorDark)),
            )
          ]),
    );
  }
}
