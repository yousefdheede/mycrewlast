import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/job_details_screen/widgets/dot_container.dart';

class JobDiscriptionPoint extends StatelessWidget {
  const JobDiscriptionPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DotContainer(forPoints: true,),
        ConstrainedBox(constraints: BoxConstraints(maxWidth: Get.width - SizeManager.w60), child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text", style: Theme.of(context).textTheme.bodyText2, maxLines: 20,))
      ],
    );
  }
}