import 'package:flutter/material.dart';
import 'package:my_crew/feature/view/app/home/search_screen/widgets/search_text_field.dart';
import 'package:my_crew/feature/view/widgets/app_back_button.dart';
import 'package:my_crew/utils/utils/utils.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        leading: const AppBackButton(),
        title: const SearchTextField(),
      ),
      body: 
           const SizedBox(),
        
    );
  }
}
