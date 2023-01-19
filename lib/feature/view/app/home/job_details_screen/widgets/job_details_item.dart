import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';

class JobDetailsItem extends StatelessWidget {
  const JobDetailsItem({super.key, required this.color, required this.label, required this.value, required this.icon});

  final Color color;
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeManager.w4),
      child: Column(
        children: [
          CircleAvatar(backgroundColor: color.withAlpha(40), radius: SizeManager.r28, child: Icon(icon, color: color, size: SizeManager.r32,),),
          SizedBox(height: SizeManager.h4,),
          Text(label, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w500, fontSize: FontSizeManager.fontSize14),),
          Text(value, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold, fontSize: FontSizeManager.fontSize14),),
        ],
      ),
    );
  }
}