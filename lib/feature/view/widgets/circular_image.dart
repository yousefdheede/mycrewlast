import 'package:flutter/cupertino.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/utils/utils/utils.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({ required this.size, required this.widget, this.backgroundColor, Key? key}) : super(key: key);

  final double size;
  final Widget widget;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? ColorManager.instance.lightGrey
      ),
      child: widget,
    );
  }
}