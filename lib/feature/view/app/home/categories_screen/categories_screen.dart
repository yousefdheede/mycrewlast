import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/category_model.dart';
import 'package:my_crew/feature/view/app/home/categories_screen/widgets/category_item.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class CategoriesScreen extends StatelessWidget {
  final catlist = catdata.catlist();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(StringKeys.categories.tr),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: SizeManager.w8, vertical: SizeManager.h12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SizeManager.w8,
            mainAxisSpacing: SizeManager.h8),
        itemCount: 7,
        itemBuilder: (context, index) => CategoryItem(catlist[index]),
      ),
    );
  }
}
