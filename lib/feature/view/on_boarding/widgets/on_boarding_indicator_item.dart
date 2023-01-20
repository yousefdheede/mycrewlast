import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/utils/utils/utils.dart';

class OnBoardingIndicatorItem extends StatelessWidget {
  const OnBoardingIndicatorItem({
    required this.selected,
    Key? key,
  }) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Container(
      width: selected ? SizeManager.w28 : SizeManager.w8,
      height: SizeManager.h6,
      decoration: BoxDecoration(
          color: selected ? ColorManager.instance.colorPrimary : ColorManager.instance.textBodyColorDark.withOpacity(0.6),
          borderRadius: BorderRadius.circular(SizeManager.r4)),
    );
  }
}