

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class ListLabel extends StatelessWidget {
  const ListLabel({super.key, required this.label, this.onPressed, this.justLabel = false, this.buttonText});

  final String label;
  final String? buttonText;
  final bool justLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children : [
        Padding(
          padding: EdgeInsets.symmetric(vertical: SizeManager.h4),
          child: Text(label, style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        if(!justLabel)...[
        InkWell(
            borderRadius: BorderRadius.circular(SizeManager.r6),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: SizeManager.h4, start: SizeManager.h4, bottom: SizeManager.h4),
            child: Text( buttonText ?? StringKeys.seeAll.tr, style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w500, color: ColorManager.instance.colorPrimary),),
          ),
        )
        ]
      ]
    );
  }
}