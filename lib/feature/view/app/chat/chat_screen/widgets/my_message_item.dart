import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/message_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';


class MyMessageItem extends StatelessWidget {
  const MyMessageItem({
    required this.message,
    required this.recpientId,
    Key? key,
  }) : super(key: key);

  final MessageModel message;
  final String recpientId;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return InkWell(
      onLongPress: () {
        _showPopupMenu(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsetsDirectional.only(
              start: SizeManager.w64,
              top: SizeManager.h4,
              bottom: SizeManager.h4,
            ),
            padding: EdgeInsets.symmetric(
                horizontal: SizeManager.w8, vertical: SizeManager.h12),
            decoration: BoxDecoration(
                color: ColorManager.instance.colorPrimary,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(SizeManager.r20),
                  bottomStart: Radius.circular(SizeManager.r12),
                  topStart: Radius.circular(SizeManager.r12),
                )),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Get.width - 110,),
              child: Text(
                message.message ?? '',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: ColorManager.instance.white,
                    fontWeight: FontWeight.w500),
                maxLines: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(_getMessageOffset(context).dx, _getMessageOffset(context).dy + 50, 0.0, 0.0),
      color: Theme.of(context).backgroundColor,
      items: [
        PopupMenuItem(
          value: 0,
          onTap: ()async {
          //  await chatViewModel.deleteMessageFromMe(
          //       recpientId: recpientId, messageId: message.id!);
          },
          child: Text(
            StringKeys.removeFromMe.tr,
          ),
        ),
        PopupMenuItem(
          value: 1,
          onTap: () async {
            // await chatViewModel.deleteMessageFromAll(
            //     recpientId: recpientId, messageId: message.id!,);
          },
          child: Text(StringKeys.removeFromAll.tr),
        )
      ],
      elevation: 20.0,
    );
  }

  Offset _getMessageOffset(BuildContext ctx) {
    final RenderBox renderBox = ctx.findRenderObject() as RenderBox; 
    return renderBox.localToGlobal(Offset.zero);
  }
}
