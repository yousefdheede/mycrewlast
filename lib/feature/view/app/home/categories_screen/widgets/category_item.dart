import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/category_model.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class CategoryItem extends StatelessWidget {
  late final catdata cat;
  CategoryItem(this.cat);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(SizeManager.r12),
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(SizeManager.r12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Get.width * 0.3,
              width: Get.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeManager.r12),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImageNetwork(
                      url: cat.imageUrl,
                      width: Get.width * 0.15,
                      height: Get.width * 0.15,
                      radius: SizeManager.r8,
                    ),
                    SizedBox(
                      height: SizeManager.h4,
                    ),
                    Text(cat.name,
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text(
                      cat.jobs,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).textTheme.bodyMedium?.color),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
