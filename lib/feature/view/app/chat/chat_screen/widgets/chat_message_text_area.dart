import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/model/user_model.dart';
import 'package:my_crew/feature/view/app/widgets/circular_container.dart';
import 'package:my_crew/utils/utils/utils.dart';

class ChatMessageTextArea extends StatelessWidget {
  const ChatMessageTextArea({
    required this.recpient,
    Key? key,
  }) : super(key: key);
  final UserModel recpient;


  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeManager.w12, vertical: SizeManager.h12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.18),
                blurRadius: 4)
          ],
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child:
        //  Obx(() {
        //   return 
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(SizeManager.r24)),
                child: TextField(
                  // controller: controller.tdMessage,
                  minLines: 1,
                  maxLines: 4,
                  maxLength: 800,
                  scrollPhysics: const BouncingScrollPhysics(),
                  onChanged: (text) {
                    // controller.changeMessageLenght(
                    //     isNotEmbty: text.trim().isNotEmpty);
                  },
                  decoration: InputDecoration(
                    counterText: '',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: SizeManager.w12),
                    enabledBorder:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              )),
              SizedBox(
                width: SizeManager.w12,
              ),
              CircularContainer(
                  width: SizeManager.w40,
                  height: SizeManager.h40,
                  color: 
                  // controller.notEmbtyMessage.value ?
                       ColorManager.instance.colorPrimary,
                      // : Theme.of(context)
                      //     .textTheme
                      //     .bodyText1
                      //     ?.color
                      //     ?.withOpacity(0.5),
                  child: InkWell(
                      onTap: () {},
                      child: Center(
                          child: Icon(
                        Icons.send_rounded,
                        size: SizeManager.r24,
                        color: ColorManager.instance.white,
                      )))),
            ],
          ),
        // }),
      );
  }
}
