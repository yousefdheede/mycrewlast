import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';


class SkillItem extends StatelessWidget {
  const SkillItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeManager.w12, vertical: SizeManager.h2),
      decoration: BoxDecoration(
        color: ColorManager.instance.colorPrimary,
        borderRadius: BorderRadius.circular(SizeManager.r4),
      ),
      child: Text('Skill', style: TextStyle(color: ColorManager.instance.white, fontWeight: FontWeight.w500), textAlign: TextAlign.justify,),
    );
  }
}