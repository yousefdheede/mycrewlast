import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/user_model.dart';
import 'package:my_crew/feature/view/app/chat/chat_screen/chat_screen.dart';
import 'package:my_crew/feature/view/app/company/add_job_screen/add_job_screen.dart';
import 'package:my_crew/feature/view/app/company/company_profile_screen/company_profile_screen.dart';
import 'package:my_crew/feature/view/app/company/compay_home_screen/widgets/company_job_item.dart';
import 'package:my_crew/feature/view/app/home/notifications_screen/notifications_screen.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class CompanyHomeScreen extends StatelessWidget {
  const CompanyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: SizeManager.w40,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: SizeManager.w8),
          child: InkWell(
              onTap: () {
                Get.to(() => const CompanyProfileScreen());
              },
              child: CircleAvatar(
                radius: SizeManager.r16,
                backgroundImage: const CachedNetworkImageProvider(
                    Constants.urlUserPlacholder),
              )),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => ChatScreen(
                    recpient: UserModel(client_name: 'Employee user'),
                  ));
            },
            icon: const Icon(
              Icons.chat_rounded,
            ),
            color: Theme.of(context).textTheme.headline1?.color,
          ),
          IconButton(
            onPressed: () {
              Get.to(() => const NotificationsScreen());
            },
            icon: const Icon(
              Icons.notifications_rounded,
            ),
            color: Theme.of(context).textTheme.headline1?.color,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => AddJobScreen());
          },
          label: Text(StringKeys.addNewJob.tr),
          icon: const Icon(Icons.add_rounded)),
      body: ListView.separated(
          itemCount: 7,
          itemBuilder: (context, index) => const CompanyJobItem(),
          separatorBuilder: (context, index) =>
              SizedBox(height: SizeManager.h12)),
    );
  }
}
