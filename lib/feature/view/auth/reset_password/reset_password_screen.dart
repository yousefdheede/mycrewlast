import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/feature/view/widgets/app_text_form_filed.dart';
import 'package:my_crew/feature/view_model/auth_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      appBar: AppBar(
          leading: const AppBackButton(),
          backgroundColor: Colors.transparent),
      body: GetBuilder<AuthViewModel>(builder: (_) {
        return Form(
          key: _.resetPasswordFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: SizeManager.w20, vertical: SizeManager.h80),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringKeys.resetPassword.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: SizeManager.h72,
              ),
              AppTextFormFiled(
                controller: _.tdResetPasswordEmail,
                label: StringKeys.email.tr,
                keyboardType: TextInputType.emailAddress,
                validator: (e) => !GetUtils.isEmail(e.toString())
                    ? StringKeys.invalidEmail.tr
                    : null,
              ),
              SizedBox(
                height: SizeManager.h32,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_.resetPasswordFormKey.currentState!.validate()) {
                      _.sendResetPasswordEmail();
                    }
                  },
                  child: Text(StringKeys.sendResetLink.tr)),
            ],
          ),
        );
      }),
    );
  }
}
