import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/auth/account_type_screen/account_type_screen.dart';
import 'package:my_crew/feature/view_model/auth_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class OnBoardingControllers extends StatelessWidget {
  const OnBoardingControllers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Padding(
      padding: EdgeInsets.only(
          left: SizeManager.w20,
          right: SizeManager.w20,
          bottom: SizeManager.h20),
      child: GetBuilder<AuthViewModel>(
        builder: (_) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Visibility(
              visible: _.onBoardingCurrentPage != 2,
              replacement: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                      onPressed: () {
                        Get.off(() => const AccountTypeScreen());
                      },
                      child: Text(StringKeys.getStarted.tr))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          _.goToLastPage();
                        },
                        child: Text(StringKeys.skip.tr),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        _.goToNextPage();
                      },
                      child: Text(StringKeys.next.tr))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
