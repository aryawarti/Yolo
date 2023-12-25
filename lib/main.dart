import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolo/authenticationScreen/login_screen.dart';
import 'package:yolo/controller/authentication_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    // initializing firebase
  await Firebase.initializeApp().then((value)
  {
    Get.put(AuthenticationController());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dating App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home:LoginScreen(),
    );
  }
}
