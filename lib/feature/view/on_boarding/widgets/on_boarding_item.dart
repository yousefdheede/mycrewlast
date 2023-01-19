import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/utils/utils/utils.dart';


class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    Key? key, required this.imagePath, required this.title, required this.body,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Padding(
          padding: EdgeInsets.all(SizeManager.w28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                imagePath, height: SizeManager.h200,
              ),
              SizedBox(
                height: SizeManager.h32,
              ),
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontWeight: FontWeight.w600)),
              SizedBox(
                height: SizeManager.h16,
              ),
              Text(body,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(
                          fontWeight: FontWeight.w500,
                          ), maxLines: 3, textAlign: TextAlign.center,),
            ],
          ),
        );
  }
}
