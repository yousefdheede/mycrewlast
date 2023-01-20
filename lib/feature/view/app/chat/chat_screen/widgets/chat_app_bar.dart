import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';
import 'package:my_crew/feature/model/user_model.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/utils/utils/utils.dart';

class ChatAppBAr extends StatelessWidget {
  const ChatAppBAr({
    required this.userModel,
    Key? key,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return ListTile(
      leading: AppImageNetwork(
          url: userModel.imageUrl,
          height: SizeManager.h44,
          width: SizeManager.w44,
          shape: BoxShape.circle),
      title: Text(
        userModel.client_name ?? '',
        style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight: FontWeight.bold, fontSize: FontSizeManager.fontSize17),
      ),
      subtitle: Text(
        'active now',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
