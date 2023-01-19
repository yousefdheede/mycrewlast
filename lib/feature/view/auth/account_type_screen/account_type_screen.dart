import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/asset/asset_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/auth/login/login_screen.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/localization/string_keys.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeManager.w16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(StringKeys.chooseAccountType.tr,style: Theme.of(context).textTheme.headline2?.copyWith(fontWeight: FontWeight.w600),),
                  SizedBox(height: SizeManager.h4,),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: SizeManager.w8),
                    child: Text(StringKeys.chooseAccountTypeMessage.tr,style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w500), maxLines: 8,),
                  ),
                  SizedBox(height: SizeManager.h60,),
                  SvgPicture.asset(AppSvgs.accountType, width: Get.width * 0.7,),
                ],
              )),
              Expanded(
                flex: 3,
                child: Row(
                children: [
                  SizedBox(
                    width: (Get.width /2 ) - 24,
                    child: OutlinedButton(onPressed: (){
                      Get.to(()=> const LoginScreen());
                    }, child: Text(StringKeys.employee.tr)),
                  ),
                  SizedBox(width: SizeManager.w16,),
                  SizedBox(
                    width: (Get.width /2 ) - 24,
                    child: OutlinedButton(onPressed: (){
                      Get.to(()=> const LoginScreen(accountType: Constants.companyAccount,));
                    }, child: Text(StringKeys.company.tr)),
                  ),
                ],
              )),
          ],
        ),
      ),
    );
  }
}