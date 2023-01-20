import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';

class ApplicantProfileImage extends StatelessWidget {
  const ApplicantProfileImage({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
              height: SizeManager.h104,
              width: SizeManager.w104,
              margin: EdgeInsetsDirectional.only(top: SizeManager.h8),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeManager.w3, vertical: SizeManager.h3),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: ColorManager.instance.colorPrimary,
                  shape: BoxShape.circle),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeManager.w2, vertical: SizeManager.h2),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: ColorManager.instance.colorPrimary,
                      shape: BoxShape.circle),
                  child:  AppImageNetwork(url: imageUrl,),
                ),
              )),
      ],
    );
  }
}
