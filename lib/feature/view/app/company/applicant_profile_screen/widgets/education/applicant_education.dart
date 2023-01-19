import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/personal_info_screen/education/widgets/education_item.dart';


class ApplicantEducation extends StatelessWidget {
  const ApplicantEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) => const EducationItem(),
      separatorBuilder: (context, index) => SizedBox(height: SizeManager.h8,),
    );
  }
}