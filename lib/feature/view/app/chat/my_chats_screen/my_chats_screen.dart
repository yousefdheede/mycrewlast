import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/user_model.dart';
import 'package:my_crew/feature/view/app/chat/my_chats_screen/widgets/my_chat_user_item.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class MyChatsScreen extends StatelessWidget {
  const MyChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      appBar: AppBar(
          leading: const AppBackButton(), title: Text(StringKeys.chats.tr)),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
            vertical: SizeManager.h20, horizontal: SizeManager.w20),
        itemCount: 10,
        itemBuilder: (context, index) => ChatUserItem(
          user: UserModel(client_name: 'Test User'),
        ),
      ),
    );
  }
}
