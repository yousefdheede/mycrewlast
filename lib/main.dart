import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_crew/feature/core/app_widget.dart';
import 'package:my_crew/utils/shared/shared_prefs.dart';
import 'package:my_crew/utils/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'feature/view_model/auth_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthViewModel()));
  await SharedPrefs.instance.initPrefs();
  Utils.instance
      .changeDeviceOrientation(orientation: DeviceOrientation.portraitUp);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}
