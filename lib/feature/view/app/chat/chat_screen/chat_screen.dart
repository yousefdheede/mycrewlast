
import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/message_model.dart';
import 'package:my_crew/feature/model/user_model.dart';
import 'package:my_crew/feature/view/app/chat/chat_screen/widgets/chat_app_bar.dart';
import 'package:my_crew/feature/view/app/chat/chat_screen/widgets/chat_message_text_area.dart';
import 'package:my_crew/feature/view/app/chat/chat_screen/widgets/my_message_item.dart';
import 'package:my_crew/feature/view/app/chat/chat_screen/widgets/received_message.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/utils/utils.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, required this.recpient}) : super(key: key);

  final UserModel recpient;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
          title: ChatAppBAr(
            userModel: recpient,
          ),
          titleSpacing: 0),
      body: Column(
          children: [
            Expanded(child: ListView(
                         padding: EdgeInsets.symmetric(
                            horizontal: SizeManager.w12, vertical: SizeManager.h12),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        reverse: true,
                        children: [
                          ReceivedMessageItem(message: MessageModel(message: 'Test Message',),),
                          MyMessageItem(message: MessageModel(message: 'Test Message'), recpientId: '',),
                          ReceivedMessageItem(message: MessageModel(message: 'Test Message',),),
                          MyMessageItem(message: MessageModel(message: 'Long Test Message Long Test Message Long Test Message Long Test Message Long Test Message Long Test Message'), recpientId: '',),
                          ReceivedMessageItem(message: MessageModel(message: 'Test Message',),),
                          MyMessageItem(message: MessageModel(message: 'Test Message'), recpientId: '',),
                          ReceivedMessageItem(message: MessageModel(message: 'Long Test Message Long Test Message Long Test Message Long Test Message Long Test Message Long Test Message Long Test Message Long Test Message Long Test Message Long Test Message',),),
                          MyMessageItem(message: MessageModel(message: 'Test Message'), recpientId: '',),
                          ReceivedMessageItem(message: MessageModel(message: 'Test Message',),),
                          MyMessageItem(message: MessageModel(message: 'Test Message'), recpientId: '',),
                          ReceivedMessageItem(message: MessageModel(message: 'Test Message',),),
                          MyMessageItem(message: MessageModel(message: 'Test Message'), recpientId: '',),
                          ReceivedMessageItem(message: MessageModel(message: 'Test Message',),),
                          MyMessageItem(message: MessageModel(message: 'Test Message'), recpientId: '',),
                          ReceivedMessageItem(message: MessageModel(message: 'Test Message',),),
                          MyMessageItem(message: MessageModel(message: 'Test Message'), recpientId: '',),
                        ],
            )),
            ChatMessageTextArea(
              recpient: recpient,
            )
          ],
        ),
    );
  }
}
