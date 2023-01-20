import 'package:flutter/cupertino.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/skills/widgets/skill_item.dart';

class ApplicantSkills extends StatelessWidget {
  const ApplicantSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: SizeManager.h8,
      spacing: SizeManager.h8,
      children: List.generate(12, (index) => const SkillItem()),
    );
  }
}