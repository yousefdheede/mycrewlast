import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/job_model.dart';
import 'package:my_crew/feature/view/app/home/home_screen/widgets/job_item.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class FavoritesScreen extends StatelessWidget {
  final joblist = jobdata.joblist();
  late final jobdata jo;
  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
        appBar: AppBar(title: Text(StringKeys.favorites.tr)),
        body: ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: SizeManager.w12, vertical: SizeManager.h16),
          itemCount: 10,
          itemBuilder: (context, index) => JobItem(joblist[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: SizeManager.h8,
          ),
        ));
  }
}
