import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchViewModel extends GetxController {
  
  final TextEditingController tdSearch = TextEditingController();


  void searchWithSpecializationOrSkills() {
    update();
  }

  void clearSearch(){
    tdSearch.clear();
    update();
  }


}