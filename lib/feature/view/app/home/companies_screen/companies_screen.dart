import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/company_model.dart';
import 'package:my_crew/feature/view/app/home/companies_screen/widgets/company_item.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class CompaniesScreen extends StatelessWidget {
  final comlist = comdata.comlist();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(StringKeys.companies.tr),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: SizeManager.w8, vertical: SizeManager.h12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: SizeManager.w8,
            mainAxisSpacing: SizeManager.h8),
        itemCount: 13,
        itemBuilder: (context, index) => CompanyItem(comlist[index]),
      ),
    );
  }
}
