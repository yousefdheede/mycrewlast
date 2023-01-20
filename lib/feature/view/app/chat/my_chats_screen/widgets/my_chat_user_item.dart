import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/user_model.dart';
import 'package:my_crew/feature/view/app/chat/chat_screen/chat_screen.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/utils/utils/utils.dart';

class ChatUserItem extends StatelessWidget {
  const ChatUserItem({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeManager.h4),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeManager.h4, horizontal: SizeManager.w8),
        onTap: () {
          Get.to(() => ChatScreen(recpient: user));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.r8)),
        leading: AppImageNetwork(
            url: user.imageUrl,
            width: SizeManager.w48,
            height: SizeManager.h48,
            shape: BoxShape.circle),
        title: Text(
          user.client_name ?? '',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'last message from this user',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        trailing: const Text(
          '11:15 PM',
        ),
        tileColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
