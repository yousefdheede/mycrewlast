import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/core/theme/asset/asset_manager.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/auth/register/register_screen.dart';
import 'package:my_crew/feature/view/auth/reset_password/reset_password_screen.dart';
import 'package:my_crew/feature/view/widgets/app_text_form_filed.dart';
import 'package:my_crew/feature/view_model/auth_view_model.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key, required this.accountType}) : super(key: key);

  final int accountType;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return GetBuilder<AuthViewModel>(initState: (_) {
      if (!Get.isRegistered()) {
        Get.put(AuthViewModel(), permanent: true);
      } else {
        Get.find<AuthViewModel>();
      }
    }, builder: (_) {
      return Form(
        key: _.loginFormKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: SizeManager.w20, vertical: SizeManager.h80),
          children: [
            SizedBox(
              height: SizeManager.h80,
            ),
            Text(
              StringKeys.login.tr,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                  // color: ColorManager.instance.textColorDark,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeManager.h32,
            ),
            AppTextFormFiled(
              // color: ColorManager.instance.white,
              controller: _.tdLoginEmail,
              label: StringKeys.email.tr,
              validator: (e) => !GetUtils.isEmail(e.toString())
                  ? StringKeys.invalidEmail.tr
                  : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              // color: ColorManager.instance.white,
              controller: _.tdLoginPassword,
              label: StringKeys.password.tr,
              obscureText: !_.passwordVisibility,
              suffixIcon: IconButton(
                  onPressed: () => _.changePasswordVisibilityState(),
                  icon: Icon(
                    !_.passwordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: ColorManager.instance.colorPrimary,
                  )),
            ),
            SizedBox(
              height: SizeManager.h12,
            ),
            InkWell(
              onTap: () => Get.to(const ResetPasswordScreen()),
              child: Text(
                StringKeys.forgetPassword.tr,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    // color: ColorManager.instance.textColorDark,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: SizeManager.h24,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthViewModel.instance
                      .signin(_.tdLoginEmail.text, _.tdLoginPassword.text);
                  /* AuthViewModel.instance
                      .signin(_.tdLoginEmail.text, _.tdLoginPassword.text);
                  _.login(accountType: accountType);
                  if (_.loginFormKey.currentState!.validate()) {
                    _.login(accountType: accountType);
                  }*/
                },
                child: Text(StringKeys.login.tr)),
            SizedBox(
              height: SizeManager.h32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(StringKeys.dontHaveAnAccount.tr,
                    style: Theme.of(context).textTheme.headline5?.copyWith()),
                SizedBox(
                  width: SizeManager.w4,
                ),
                InkWell(
                    onTap: (() => Get.to(RegisterScreen(
                          accountType: accountType,
                        ))),
                    child: Text(StringKeys.createAccount.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(
              height: SizeManager.h32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: SizeManager.w80,
                    child: Divider(
                      color: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.color
                          ?.withOpacity(0.5),
                      indent: SizeManager.w12,
                      endIndent: SizeManager.w12,
                    )),
                Text(StringKeys.or.tr,
                    style: Theme.of(context).textTheme.headline6?.copyWith()),
                SizedBox(
                    width: SizeManager.w80,
                    child: Divider(
                      color: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.color
                          ?.withOpacity(0.5),
                      indent: SizeManager.w12,
                      endIndent: SizeManager.w12,
                    )),
              ],
            ),
            SizedBox(
              height: SizeManager.h32,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  _.signinwithGoogle(accountType: accountType);
                },
                icon: SvgPicture.asset(
                  AppSvgs.google,
                  width: SizeManager.w28,
                ),
                label: Text(StringKeys.signInWithGoogle.tr))
          ],
        ),
      );
    });
  }
}
