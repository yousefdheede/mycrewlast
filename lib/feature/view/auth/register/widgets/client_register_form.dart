import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_crew/feature/core/theme/asset/asset_manager.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/feature/view/app/map/map.dart';
import 'package:my_crew/feature/view/widgets/app_text_form_filed.dart';
import 'package:my_crew/feature/view_model/auth_view_model.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

import '../../../app/home/home_placeholder_screen/home_placeholder_screen.dart';

class ClientRegisterForm extends StatelessWidget {
  const ClientRegisterForm({
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
              label: StringKeys.fullName.tr,
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
            Text(
              StringKeys.gender.tr,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: SizeManager.h4,
            ),
            Row(
              children: [
                SizedBox(
                  width: (Get.width / 3.5),
                  height: SizeManager.h40,
                  child: _.male
                      ? OutlinedButton(
                          onPressed: () {
                            _.changeGender();
                          },
                          child: Text(StringKeys.male.tr))
                      : ElevatedButton(
                          onPressed: () {}, child: Text(StringKeys.male.tr)),
                ),
                SizedBox(
                  width: SizeManager.w16,
                ),
                SizedBox(
                  width: (Get.width / 3.5),
                  height: SizeManager.h40,
                  child: !_.male
                      ? OutlinedButton(
                          onPressed: () {
                            _.changeGender();
                          },
                          child: Text(StringKeys.female.tr))
                      : ElevatedButton(
                          onPressed: () {}, child: Text(StringKeys.female.tr)),
                ),
              ],
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              controller: _.tdRegisterSpecialization,
              label: StringKeys.specialization.tr,
              validator: (e) => e.toString().isEmpty
                  ? StringKeys.pleaseEnterYourSpecialization.tr
                  : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              controller: _.tdRegisterSkills,
              label: StringKeys.skills.tr,
              validator: (e) => e.toString().isEmpty
                  ? StringKeys.pleaseEnterYourSkills.tr
                  : null,
            ),
            SizedBox(
              height: SizeManager.h20,
            ),
            AppTextFormFiled(
              controller: _.tdRegisterBio,
              label: StringKeys.bio.tr,
              maxLines: 4,
              validator: (e) =>
                  e.toString().isEmpty ? StringKeys.pleaseEnterBio.tr : null,
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
                validator: (t) => _.tdRegisterPassword.text.trim() !=
                        _.tdRegisterConfirmPassword.text.trim()
                    ? StringKeys.theTwoPasswordsDoesNotMatches.tr
                    : null,
                suffixIcon: IconButton(
                    onPressed: () => _.changeConfirmPasswordVisibilityState(),
                    icon: Icon(
                      !_.confirmPasswordVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: ColorManager.instance.colorPrimary,
                    ))),
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
                    onTap: (pos) {
                      Get.to(() => const mymap());
                    },
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
                    _.registerWithEmollient();
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
                  Get.offAll(() => const HomePlaceholderScreen());
                  _.signinwithGoogle(accountType: Constants.clientAccount);
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
