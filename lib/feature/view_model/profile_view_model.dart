import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_crew/feature/view/auth/account_type_screen/account_type_screen.dart';
import 'package:my_crew/feature/view_model/home_view_model.dart';
import 'package:my_crew/feature/view_model/search_view_model.dart';
import 'package:my_crew/utils/shared/shared_prefs.dart';


class ProfileViewModel extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController tdFullName = TextEditingController();
  TextEditingController tdEmail = TextEditingController();
  TextEditingController tdPhone = TextEditingController();
  TextEditingController tdDOB = TextEditingController();
  bool maleGender = true; 

  GlobalKey<FormState> preferencesFromKey = GlobalKey();
  TextEditingController tdPreferedActivity = TextEditingController();

  File? profileImage;

  void changeSelectedGender(){
    
  }

  void pickImage({required ImageSource imageSource}) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: imageSource);
    if(pickedImage != null){
      profileImage = File(pickedImage.path);
    }
    update();
  }

  void updateProfile()async{}

 

    Future<void> refreshUserData() async {
    
  }

  void resetEditProfile(){}


    void setSelectedActivity({required String activity}) {
    tdPreferedActivity.text = activity;
  }



  void logout() async {
    // auth.signOut();
    await SharedPrefs.instance.clearUserPrefs();
    await Get.delete<SearchViewModel>(force: true);
    Get.offAll(()=> const AccountTypeScreen());
    await Get.delete<HomeViewModel>(force: true);
    await Get.delete<ProfileViewModel>(force: true);
  }

    void changeTheme({required ThemeMode mode}){
    SharedPrefs.instance.setTheme(mode: mode);
    Get.changeThemeMode(mode);
    update();
  }

  saveUserAvatar() {}
}