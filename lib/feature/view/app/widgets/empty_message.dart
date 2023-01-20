import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/asset/asset_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/utils/utils/utils.dart';


class EmptyMessage extends StatelessWidget {
  const EmptyMessage({
    Key? key, required this.message, this.svgPath,
  }) : super(key: key);

  final String message;
  final String? svgPath;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(svgPath ?? AppSvgs.notFound, width: Get.width * 0.4,),
      SizedBox(height: SizeManager.h32, width: Get.width,),
      Text(message, style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.w600,), textAlign: TextAlign.center,)
    ],);
  }
}