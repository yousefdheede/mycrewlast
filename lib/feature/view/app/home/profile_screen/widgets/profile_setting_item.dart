import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';
import 'package:my_crew/utils/utils/utils.dart';


class ProfileSettingsItem extends StatelessWidget {
  const ProfileSettingsItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.hasNextScreen = true,
    this.subTitle
  }) : super(key: key);

  final IconData icon;
  final String label;
  final String? subTitle;
  final void Function() onPressed;
  final bool hasNextScreen;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeManager.h4),
      child: ListTile(
        onTap: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.r8)),
        leading: Container(
          width: SizeManager.w40,
          height: SizeManager.h40,
          decoration: BoxDecoration(
              color: ColorManager.instance.colorPrimary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(SizeManager.r8)),
          child: Icon(
            icon,
            color: ColorManager.instance.colorPrimary,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            if(subTitle != null) ... [
            Text(subTitle!, style: TextStyle(color : Theme.of(context).textTheme.bodyText1?.color, fontSize: FontSizeManager.fontSize14)),
            ]
          ],
        ),
        tileColor: Theme.of(context).backgroundColor,
        trailing: Visibility(
            visible: hasNextScreen,
            child: Icon(
              Utils.instance.isArabic() ? Icons.keyboard_arrow_left :  Icons.keyboard_arrow_right,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.color
                  ?.withOpacity(0.5),
            )),
      ),
    );
  }
}
