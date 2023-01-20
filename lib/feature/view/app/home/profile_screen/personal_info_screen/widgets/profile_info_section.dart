import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/widgets/list_label.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key, required this.label, this.onPressed, required this.content, this.hasButton = true});

  final String label;
  final void Function()? onPressed;
  final Widget content;
  final bool hasButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         SizedBox(height: SizeManager.h8,),
               ListLabel(label: label, buttonText: StringKeys.edit.tr, justLabel: !hasButton, onPressed: onPressed, ),
               SizedBox(height: SizeManager.h4,),
               Container(
                padding: EdgeInsets.symmetric(horizontal: SizeManager.w12, vertical: SizeManager.h12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeManager.r12),
                  color: Theme.of(context).backgroundColor
                ),
                child: content,
               )
      ],
    );
  }
}