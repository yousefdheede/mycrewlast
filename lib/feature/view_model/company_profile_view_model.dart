import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_crew/feature/view/auth/account_type_screen/account_type_screen.dart';


class CompanyProfileViewModel extends GetxController {

File? companyLogo ;


  void pickImage({required ImageSource imageSource}) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: imageSource);
    if(pickedImage != null){
      companyLogo = File(pickedImage.path);
    }
    update();
  }

    void logout() async {
    Get.offAll(()=> const AccountTypeScreen());
  }

  saveCompanyLogo() {}

}