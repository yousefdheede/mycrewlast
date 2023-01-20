import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/home/notifications_screen/widgets/notification_item.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      appBar: AppBar(
          leading: const AppBackButton(),
          title: Text(StringKeys.notifications.tr)),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: SizeManager.h16,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => const NotificationItem(),
        separatorBuilder: (context, index) => SizedBox(
          height: SizeManager.h4,
        ),
      ),
    );
  }
}
