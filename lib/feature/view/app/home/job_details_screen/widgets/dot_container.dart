import 'package:flutter/material.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';

class DotContainer extends StatelessWidget {
  const DotContainer({super.key, this.forPoints = false});
final bool forPoints;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: SizeManager.w20, start: forPoints ? 0 : SizeManager.w20, top: forPoints ? SizeManager.h6 : 0),
      width: SizeManager.w4,
      height: SizeManager.h4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).textTheme.bodyText2?.color
      ),
    );
  }
}