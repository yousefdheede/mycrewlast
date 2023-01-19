

import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';

class BasicInfoItem extends StatelessWidget {
  const BasicInfoItem({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeManager.h8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w500),),
          SizedBox(width: SizeManager.w8,),
          Text(value,style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: FontSizeManager.fontSize14, fontWeight: FontWeight.w500),),
        ],
      ),
    );
    }
}