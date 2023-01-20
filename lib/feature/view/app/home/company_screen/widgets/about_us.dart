import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/widgets/list_label.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListLabel(label: StringKeys.aboutUs.tr, justLabel: true,),
        SizedBox(height: SizeManager.h2,),
        Padding(
          padding: EdgeInsetsDirectional.only(start: SizeManager.w12),
          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text", style: Theme.of(context).textTheme.bodyText2, maxLines: 30,),
        )
      ],
    );
  }
}