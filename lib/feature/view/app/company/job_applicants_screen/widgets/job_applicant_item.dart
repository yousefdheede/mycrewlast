

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/company/applicant_profile_screen/applicant_profile_screen.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class JobApplicantItem extends StatelessWidget {
  const JobApplicantItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: SizeManager.w16, right: SizeManager.w16, bottom: SizeManager.h16,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeManager.r12),
      color: Theme.of(context).backgroundColor
      ),
      child: Column(
        children: [
          ListTile(
            leading: AppImageNetwork(width: SizeManager.w40, height: SizeManager.h40, shape: BoxShape.circle),
            title: Text('Applicant name', style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
            trailing:  SizedBox(
            height: SizeManager.h34,
            width: SizeManager.w124,
            child: TextButton(
                onPressed: () {
                  Get.to(()=> const ApplicantProfileScreen());
                },
                child: Text(StringKeys.viewProfile.tr))),
            contentPadding: EdgeInsets.zero,
          ),
          SizedBox(height: SizeManager.h4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: SizedBox(height: SizeManager.h36, child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeManager.r12))), child: Text(StringKeys.accept.tr),))),
              SizedBox(width: SizeManager.w16,),
              Expanded(child: SizedBox(height: SizeManager.h36, child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).textTheme.bodyText2?.color?.withOpacity(0.25), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeManager.r12))), child: Text(StringKeys.reject.tr),)))   
            ],
          )
        ],
      ),
    );
  }
}