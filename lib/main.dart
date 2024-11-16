import 'package:apii/controller/bottom_nav_ctr.dart';
import 'package:apii/controller/home_page.dart';
import 'package:apii/makeupp/PostVieww.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(BottomNavCtr());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => PostVieww(),
        ),
      ],
    );
  }
}
