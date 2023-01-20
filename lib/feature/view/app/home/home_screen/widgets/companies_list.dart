import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/company_model.dart';
import 'package:my_crew/feature/view/app/home/companies_screen/companies_screen.dart';
import 'package:my_crew/feature/view/app/home/companies_screen/widgets/company_item.dart';
import 'package:my_crew/feature/view/app/widgets/list_label.dart';
import '../../../../../../utils/localization/string_keys.dart';

class CompaniesList extends StatelessWidget {
  final comlist = comdata.comlist();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeManager.w12),
          child: ListLabel(
              label: StringKeys.companies.tr,
              onPressed: () {
                Get.to(() => CompaniesScreen());
              }),
        ),
        SizedBox(
          height: SizeManager.h4,
        ),
        SizedBox(
          height: Get.width * 0.3,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: SizeManager.w12),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => CompanyItem(comlist[index]),
            separatorBuilder: (context, index) => SizedBox(
              width: SizeManager.w8,
            ),
          ),
        ),
      ],
    );
  }
}
