import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';
import 'package:my_crew/feature/view_model/search_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return GetBuilder<SearchViewModel>(
      initState: (_){
        if(!Get.isRegistered<SearchViewModel>()){
          Get.put(SearchViewModel());
        }
      },
      builder: (_) {
      return SizedBox(
        width: Get.width - 60,
        child: TextField(
          controller: _.tdSearch,
          style: Theme.of(context).textTheme.headline5,
          decoration: InputDecoration(
            suffixIcon: _.tdSearch.text.isEmpty ? null : IconButton(
                  onPressed: () {
                    _.clearSearch();
                  },
                  icon: Icon(Icons.close,
                      color: Theme.of(context).textTheme.headline1?.color)),
            filled: true,
            isDense: true,
            fillColor: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.2),
            hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: FontSizeManager.fontSize16        ),
              hintText: StringKeys.search.tr,
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeManager.r20), borderSide: const BorderSide(width: 0, style: BorderStyle.none),),
              ),
          onChanged: (txt) {
            _.searchWithSpecializationOrSkills();
          },
        ),
      );
    });
  }
}