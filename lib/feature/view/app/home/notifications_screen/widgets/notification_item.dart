import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/widgets/app_image_network.dart';
import 'package:my_crew/feature/view/app/widgets/circular_container.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).backgroundColor,
      contentPadding: EdgeInsets.symmetric(
          vertical: SizeManager.h6, horizontal: SizeManager.w16),
      leading: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
        AppImageNetwork(
          width: SizeManager.w48,
          height: SizeManager.h48,
          radius: SizeManager.r12,
        ),
        CircularContainer(
            width: SizeManager.w20,
            height: SizeManager.h20,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Icon(
              Icons.message_rounded,
              size: SizeManager.r12,
              color: ColorManager.instance.error,
            ))
      ]),
      title: Text(
        'Notification Title',
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        'This is Notification sub title This is Notification sub title This is Notification sub title This is Notification sub title',
        style: Theme.of(context).textTheme.bodyText2,
        maxLines: 2,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.access_time,
            size: SizeManager.r12,
            color:
                Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.6),
          ),
          SizedBox(
            width: SizeManager.w4,
          ),
          Text(
            '1h ago',
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.color
                    ?.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
