import 'package:flutter/material.dart';
import 'package:my_crew/utils/utils/utils.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({Key? key, required this.width, required this.height, required this.child, this.color}) : super(key: key);
  final double width;
  final double height;
  final Widget child;
  final Color? color;
 
  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return SizedBox(
      child: Container(
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(color: color ?? Theme.of(context).backgroundColor.withOpacity(0.8), shape: BoxShape.circle),
        child: child,
      ),
    );
  }
}