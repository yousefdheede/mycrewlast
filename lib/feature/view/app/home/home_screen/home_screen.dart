import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/chat/my_chats_screen/my_chats_screen.dart';
import 'package:my_crew/feature/view/app/home/home_screen/widgets/categories_list.dart';
import 'package:my_crew/feature/view/app/home/home_screen/widgets/companies_list.dart';
import 'package:my_crew/feature/view/app/home/home_screen/widgets/jobs_list.dart';
import 'package:my_crew/feature/view/app/home/search_screen/search_screen.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StringKeys.home.tr),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const MyChatsScreen());
            },
            icon: const Icon(Icons.message_rounded),
            color: Theme.of(context).textTheme.headline1?.color,
          ),
          IconButton(
            onPressed: () {
              Get.to(() => const SearchScreen());
            },
            icon: const Icon(Icons.search_rounded),
            color: Theme.of(context).textTheme.headline1?.color,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: SizeManager.h16,
        ),
        children: [
          CategoriesList(),
          SizedBox(
            height: SizeManager.h20,
          ),
          JobsList(),
          SizedBox(
            height: SizeManager.h20,
          ),
          CompaniesList(),
        ],
      ),
    );
  }
}
