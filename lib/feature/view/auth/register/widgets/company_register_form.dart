import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_crew/feature/core/theme/asset/asset_manager.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/widgets/app_text_form_filed.dart';
import 'package:my_crew/feature/view_model/auth_view_model.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

import '../../../app/company/compay_home_screen/company_home_screen.dart';
import '../../../app/map/map.dart';

class CompanyRegisterForm extends StatelessWidget {
  const CompanyRegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return GetBuilder<AuthViewModel>(builder: (_) {
      return Form(
        key: _.registerFormKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: SizeManager.w16, vertical: SizeManager.h40),
          children: [
            AppTextFormFiled(
              controller: _.tdRegisterFullName,
              label: StringKeys.companyName.tr,
              validator: (e) => e.toString().isEmpty
                  ? StringKeys.pleaseEnterRealName.tr
                  : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              controller: _.tdRegisterEmail,
              label: StringKeys.email.tr,
              validator: (e) => !GetUtils.isEmail(e.toString())
                  ? StringKeys.invalidEmail.tr
                  : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              controller: _.tdRegisterPhone,
              keyboardType: TextInputType.phone,
              label: StringKeys.phoneNumber.tr,
              validator: (e) => !GetUtils.isPhoneNumber(e.toString())
                  ? StringKeys.pleaseEnterRealPhoneNumber.tr
                  : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              controller: _.tdRegisterJobs,
              label: StringKeys.jobs.tr,
              validator: (e) =>
                  e.toString().isEmpty ? StringKeys.pleaseEnterJobs.tr : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              controller: _.tdRegisterDescriptuin,
              label: StringKeys.description.tr,
              maxLines: 4,
              validator: (e) => e.toString().isEmpty
                  ? StringKeys.pleaseEnterCompanyDescription.tr
                  : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              controller: _.tdRegisterPassword,
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
              validator: (t) =>
                  t.toString().length < 8 ? StringKeys.weakPassword.tr : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              controller: _.tdRegisterConfirmPassword,
              label: StringKeys.confirmPassword.tr,
              obscureText: !_.confirmPasswordVisibility,
              suffixIcon: IconButton(
                  onPressed: () => _.changeConfirmPasswordVisibilityState(),
                  icon: Icon(
                    !_.confirmPasswordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: ColorManager.instance.colorPrimary,
                  )),
              validator: (t) => _.tdRegisterConfirmPassword.text.trim() !=
                      _.tdRegisterPassword.text.trim()
                  ? StringKeys.theTwoPasswordsDoesNotMatches.tr
                  : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            SizedBox(
              height: SizeManager.h174,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeManager.r20),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition:
                        const CameraPosition(target: LatLng(31.9522, 35.2332)),
                    compassEnabled: false,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: false,
                    onTap: (pos) {  Get.to(() => const mymap());},
                    onMapCreated: (GoogleMapController controller) {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeManager.h32,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_.registerFormKey.currentState!.validate()) {
                    _.registerCompany();
                  }
                },
                child: Text(StringKeys.createAnAccount.tr)),
            SizedBox(
              height: SizeManager.h32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(StringKeys.haveAnAccount.tr,
                    style: Theme.of(context).textTheme.headline5?.copyWith()),
                SizedBox(
                  width: SizeManager.w4,
                ),
                InkWell(
                    onTap: (() => Get.back()),
                    child: Text(StringKeys.login.tr,
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
                  AuthViewModel.instance.register(_.tdRegisterEmail.text.trim(),
                      _.tdRegisterPassword.text.trim());
                  Get.offAll(() => const CompanyHomeScreen());

                  _.signinwithGoogle(accountType: Constants.companyAccount);
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
