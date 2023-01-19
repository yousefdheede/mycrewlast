import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/core/theme/text_theme/font_size_manager.dart';

class ContactItem extends StatelessWidget {
  const ContactItem(
      {super.key,
      this.onPressed,
      required this.title,
      required this.subTitle,
      required this.icon});

  final void Function()? onPressed;
  final String title;
  final String subTitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(SizeManager.r12),
        color: Theme.of(context).backgroundColor,
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(SizeManager.r12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeManager.r12),
          ),
          padding: EdgeInsets.symmetric(horizontal: SizeManager.w12, vertical: SizeManager.h6),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: ColorManager.instance.colorPrimary.withOpacity(0.15),
                child: icon),
                SizedBox(width: SizeManager.w12,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(title, style: Theme.of(context).textTheme.headline5),
                   Text(subTitle, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: FontSizeManager.fontSize14)),
                  ],
                ))
            ],
          ),
        ),
      ),
    );
   
  }
}
