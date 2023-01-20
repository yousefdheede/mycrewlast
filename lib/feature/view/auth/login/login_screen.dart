import 'package:flutter/material.dart';
import 'package:my_crew/feature/view/auth/login/widgets/login_form.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/utils/utils.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, this.accountType = Constants.clientAccount}) : super(key: key);

  final int accountType;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: const AssetImage(AppImages.loginBackground), fit: BoxFit.cover, colorFilter: ColorFilter.mode(ColorManager.instance.textColor.withOpacity(0.4), BlendMode.multiply))
        // ),
        ),
        LoginForm(accountType : accountType)
      ],)
    );
  }
}