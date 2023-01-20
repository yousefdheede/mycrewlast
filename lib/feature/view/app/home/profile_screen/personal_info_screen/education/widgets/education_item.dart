import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';

class EducationItem extends StatelessWidget {
  const EducationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Bachelor in Computer Science',style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),maxLines: 3,),
        Text('An-Najah National University - Nablus',style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w500, fontSize: FontSizeManager.fontSize14),maxLines: 2,),
        Text('2019 - 2023',style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w500, fontSize: FontSizeManager.fontSize14), maxLines: 1,),
      ],
    );
  }
}