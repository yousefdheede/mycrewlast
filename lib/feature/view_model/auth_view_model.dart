import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_crew/feature/core/theme/asset/asset_manager.dart';
import 'package:my_crew/feature/model/job_model.dart';
import 'package:my_crew/feature/view/app/company/compay_home_screen/company_home_screen.dart';
import 'package:my_crew/feature/view/app/home/home_placeholder_screen/home_placeholder_screen.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:my_crew/utils/localization/string_keys.dart';
import 'package:my_crew/utils/utils/utils.dart';

import '../back/db_helper.dart';
import '../model/company_model.dart';
import '../model/user_model.dart';
import 'apiendpoints.dart';

//ChangeNotifier
class AuthViewModel extends GetxController {
  static AuthViewModel instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  // Login screen
  final TextEditingController tdLoginEmail = TextEditingController();
  final TextEditingController tdLoginPassword = TextEditingController();

  // Register screen
  final TextEditingController tdRegisterFullName = TextEditingController();
  final TextEditingController tdRegisterEmail = TextEditingController();
  final TextEditingController tdRegisterPhone = TextEditingController();
  final TextEditingController tdRegisterPassword = TextEditingController();
  final TextEditingController tdRegisterConfirmPassword =
      TextEditingController();
  final TextEditingController tdRegisterBio = TextEditingController();
  final TextEditingController tdRegisterSpecialization =
      TextEditingController();
  final TextEditingController tdRegistergender = TextEditingController();
  final TextEditingController tdRegisterSkills = TextEditingController();

  final TextEditingController tdRegisterJobs = TextEditingController();
  final TextEditingController tdRegisterDescriptuin = TextEditingController();
  bool male = true;

  // Reset password screen
  final TextEditingController tdResetPasswordEmail = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  late final int accountType;
  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //////
  List<UserModel> allUsers = [];
  List<JobModel> allJobs = [];
  List<CompanyModel> allCompanys = [];
  List<JobModel> savedJobs = [];
  List<JobModel> appliedJobs = [];
  //////////////
  registerWithEmollient() async {
    UserModel usermodel = UserModel(
      client_name: tdRegisterFullName.text,
      client_email: tdRegisterEmail.text,
      client_phone: tdRegisterPhone.text,
      client_bio: tdRegisterBio.text,
      client_gender: tdRegistergender.text,
      client_field: tdRegisterSpecialization.text,
      client_password: tdRegisterPassword.text,
    );
    allUsers =
        (await DbHelper.dbHelper.insertNewclient(usermodel)) as List<UserModel>;
    Utils.instance.showProgressDialog();

    Get.offAll(() => const HomePlaceholderScreen());
    Utils.instance.hideProgressDialog();
  }

  Future<void> registerWithEmailcompany() async {
    try {
      var headers = {'Content-Type': 'application/jason'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerUrl);
      Map body = {
        'name': tdRegisterFullName.text,
        'email': tdRegisterEmail.text.trim(),
        'phonenumber': tdRegisterPhone.text,
        'speclization': tdRegisterSpecialization.text,
        'skills': tdRegisterSkills.text,
        'bio': tdRegisterBio.text,
        'password': tdRegisterPassword.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        // ignore: unrelated_type_equality_checks
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          clearAll();
          registerCompany();
        } else {
          throw jsonDecode(response.body)["message"] ??
              "unknown error occurred";
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "unknown error occurred";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }

  Future<void> loginapi() async {
    var headers = {'Content-Type': 'application/jason'};
    try {
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginUrl);
      Map<String, dynamic> body = {
        'email': tdRegisterEmail.text.trim(),
        'password': tdRegisterPassword.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        // ignore: unrelated_type_equality_checks
        // var code = json['code'];

        if (json['code'] == 0) {
          var token = json['data']['Token'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          tdRegisterPassword.clear();
          tdRegisterEmail.clear();
          login(accountType: accountType);
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "unknown error occurred";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }

  void changePasswordVisibilityState() {
    passwordVisibility = !passwordVisibility;
    update();
    Future.delayed(const Duration(seconds: 2), () {
      passwordVisibility = false;
      update();
    });
  }

  void changeConfirmPasswordVisibilityState() {
    confirmPasswordVisibility = !confirmPasswordVisibility;
    update();
    Future.delayed(const Duration(seconds: 2), () {
      confirmPasswordVisibility = false;
      update();
    });
  }

  void changeGender() {
    male = !male;
    update();
  }

  void login({required int accountType}) async {
    try {
      Utils.instance.showProgressDialog();
      Get.offAll(() => accountType == Constants.clientAccount
          ? const HomePlaceholderScreen()
          : const CompanyHomeScreen());
      clearAll();
      Utils.instance.hideProgressDialog();
    } catch (e) {
      Utils.instance.hideProgressDialog();
      Utils.instance.snackError(body: e.toString());
    }
  }

  void registerClient() async {
    try {
      Utils.instance.showProgressDialog();
      Get.offAll(() => const HomePlaceholderScreen());
      Utils.instance.hideProgressDialog();
    } catch (e) {
      Utils.instance.hideProgressDialog();
      Utils.instance.snackError(body: e.toString());
    }
  }

  void registerCompany() async {
    try {
      Utils.instance.showProgressDialog();
      Get.offAll(() => const CompanyHomeScreen());
      Utils.instance.hideProgressDialog();
    } catch (e) {
      Utils.instance.hideProgressDialog();
      Utils.instance.snackError(body: e.toString());
    }
  }

  _initialScreen(User? user) {
    if (user == null) {
      login(accountType: accountType);
    } else {
      Get.offAll(() => const HomePlaceholderScreen());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          titleText: Text(
            "Account creation failed!!!!!!!",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }
//          email: tdLoginEmail.text, password: tdLoginPassword.text);

  void signin(String email, password) async {
    if (email == 'dheede.2000@gmail.com' && password == '21601910') {
      Utils.instance.showProgressDialog();
      Get.offAll(() => const HomePlaceholderScreen());
      clearAll();
    } else if (email == 'dana@gmail.com' && password == '21601910') {
      Utils.instance.showProgressDialog();
      Get.offAll(() => const CompanyHomeScreen());
      clearAll();
    } else {
      clearAll();
      Get.snackbar("About login", "login message",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          titleText: const Text(
            "Account login failed!!!!!!!",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              const Text('Error', style: TextStyle(color: Colors.white)));
    }
    /* try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if(email=='dheede.2000@gmail.com'){
        Utils.instance.showProgressDialog();
        Get.offAll(() => const HomePlaceholderScreen());
      }
      else{
        Utils.instance.showProgressDialog();
        Get.offAll(() => const CompanyHomeScreen());
      }
      Utils.instance.showProgressDialog();
      Get.offAll(() => accountType == Constants.clientAccount
          ? const HomePlaceholderScreen()
          : const CompanyHomeScreen());
      clearAll();
      Utils.instance.hideProgressDialog();
      login(accountType: accountType);
      if (loginFormKey.currentState!.validate()) {
        login(accountType: accountType);
      }
    } catch (e) {
      Get.snackbar("About login", "login message",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          titleText: Text(
            "Account login failed!!!!!!!",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }*/
  }

  Future<void> saveUserData(
      {required String userId, required int accountType}) async {}

  Future<void> saveUserDataFromSoicalMediaSignIn(
      {required int accountType, required dynamic user}) async {}

  Future<void> getUserData({required String userId}) async {}

  void sendEmailVerification() {}

  void sendResetPasswordEmail() {
    Get.back();
  }

  void loginWithGoogle({required int accountType}) async {
    try {
      Utils.instance.showProgressDialog();
      Get.offAll(() => accountType == Constants.clientAccount
          ? const HomePlaceholderScreen()
          : const CompanyHomeScreen());
      Utils.instance.hideProgressDialog();
    } catch (e) {
      Logger().e(e);
    }
  }

  signinwithGoogle({required int accountType}) async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      Utils.instance.showProgressDialog();
      Get.offAll(() => accountType == Constants.clientAccount
          ? const HomePlaceholderScreen()
          : const CompanyHomeScreen());
      Utils.instance.hideProgressDialog();
    } catch (e) {
      Logger().e(e);
    }
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void clearAll() {
    tdLoginEmail.clear();
    tdLoginPassword.clear();
    tdRegisterEmail.clear();
    tdRegisterFullName.clear();
    tdRegisterPassword.clear();
    tdRegisterPhone.clear();
    tdResetPasswordEmail.clear();
  }

  // On boarding section
  final PageController pageController = PageController();
  int onBoardingCurrentPage = 0;

  void changeOnBoardingPage({required int pageIndex}) {
    onBoardingCurrentPage = pageIndex;
    update();
  }

  void goToNextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    update();
  }

  void goToLastPage() {
    pageController.animateToPage(2,
        curve: Curves.easeInOut, duration: const Duration(milliseconds: 500));
    update();
  }

  // On boarding data
  List<String> titles = [
    StringKeys.onBoardingTitle1.tr,
    StringKeys.onBoardingTitle2.tr,
    StringKeys.onBoardingTitle3.tr
  ];
  List<String> bodys = [
    StringKeys.onBoardingBody1.tr,
    StringKeys.onBoardingBody2.tr,
    StringKeys.onBoardingBody3.tr
  ];
  List<String> images = [
    AppSvgs.onBoarding1,
    AppSvgs.onBoarding2,
    AppSvgs.onBoarding3
  ];
}
