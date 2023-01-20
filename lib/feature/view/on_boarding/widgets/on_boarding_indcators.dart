
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/on_boarding/widgets/on_boarding_indicator_item.dart';
import 'package:my_crew/feature/view_model/auth_view_model.dart';
import 'package:my_crew/utils/utils/utils.dart';


class OnBoardingIndicators extends StatelessWidget {
  const OnBoardingIndicators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInToLinear,
      child: GetBuilder<AuthViewModel>(
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnBoardingIndicatorItem(
                selected: _.onBoardingCurrentPage == 0,
              ),
              SizedBox(
                width: SizeManager.w4,
              ),
              OnBoardingIndicatorItem(
                selected: _.onBoardingCurrentPage == 1,
              ),
              SizedBox(
                width: SizeManager.w4,
              ),
              OnBoardingIndicatorItem(
                selected: _.onBoardingCurrentPage == 2,
              ),
            ],
          );
        },
      ),
    );
  }
}