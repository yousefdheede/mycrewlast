import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/message_model.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/utils/utils/utils.dart';

class ReceivedMessageItem extends StatelessWidget {
  const ReceivedMessageItem({
    required this.message,
    this.senderImage,
    Key? key,
  }) : super(key: key);

  final MessageModel message;
  final String? senderImage;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Align(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImageNetwork(
              url: senderImage,
              height: SizeManager.w24,
              width: SizeManager.w24,
              shape: BoxShape.circle),
          SizedBox(
            width: SizeManager.w8,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsetsDirectional.only(
              end: SizeManager.w64,
              top: SizeManager.h4,
              bottom: SizeManager.h4,
            ),
            padding: EdgeInsets.symmetric(
                horizontal: SizeManager.w8, vertical: SizeManager.h12),
            decoration: BoxDecoration(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.color
                    ?.withOpacity(0.35),
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(SizeManager.r12),
                  bottomEnd: Radius.circular(SizeManager.r12),
                  bottomStart: Radius.circular(SizeManager.r20),
                )),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Get.width - 140),
              child: Text(
                message.message ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.w500),
                maxLines: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
