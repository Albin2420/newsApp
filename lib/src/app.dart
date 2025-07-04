import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:newsapp/src/presentation/screens/Home/Homescreen.dart';
import 'package:newsapp/src/presentation/screens/splash/splashscreen.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Homescreen(),
    );
  }
}
