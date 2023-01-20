import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/view/auth/register/widgets/client_register_form.dart';
import 'package:my_crew/feature/view/auth/register/widgets/company_register_form.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key, required this.accountType}) : super(key: key);

  final int accountType;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const AppBackButton(),
          title: Text(StringKeys.createAnAccount.tr),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
            ),
            accountType == Constants.clientAccount
                ? const ClientRegisterForm()
                : const CompanyRegisterForm()
          ],
        ));
  }
}
