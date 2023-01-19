import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class Constants {
  static const String tajwal = 'tajwal';
  static const String enLangCode = 'en';
  static const String arLangCode = 'ar';
  
  static const String deafultUserAvatar =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdpJpPgl-3X9vkWdFNhVZCdkzX4i0R5dPY2w&usqp=CAU';
  static const String errorImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMxmz1cU95HuJBlOJyGL_J8qPgt_I8svTn4g&usqp=CAU';
  static const String appName = "My Crew";

  // Account types
  static const int clientAccount = 0;
  static const int companyAccount = 1;


  // local databse column keys
  static const String userIdKey = "user_id";

  static const String urlUserPlacholder = "https://jenalk.ahdtech.com/dev/assets/img/no-user.png";
  static Size debugBeviceSize = Get.size;

  // theme modes
}
