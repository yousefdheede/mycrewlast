import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/category_model.dart';
import 'package:my_crew/feature/view/app/home/categories_screen/categories_screen.dart';
import 'package:my_crew/feature/view/app/home/categories_screen/widgets/category_item.dart';
import 'package:my_crew/feature/view/app/widgets/list_label.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class CategoriesList extends StatelessWidget {
  final catlist = catdata.catlist();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeManager.w12),
          child: ListLabel(
              label: StringKeys.categories.tr,
              onPressed: () {
                Get.to(() => CategoriesScreen());
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
            itemBuilder: (context, index) => CategoryItem(catlist[index]),
            separatorBuilder: (context, index) => SizedBox(
              width: SizeManager.w8,
            ),
          ),
        ),
      ],
    );
  }
}
