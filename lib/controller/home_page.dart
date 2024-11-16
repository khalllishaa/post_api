import 'package:apii/controller/bottom_nav_ctr.dart';
import 'package:apii/makeup/PostView.dart';
import 'package:apii/makeupp/PostVieww.dart';
import 'package:apii/menu/profile.dart';
import 'package:apii/menu/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance BottomNavCtr tanpa kontroler responsif
    final BottomNavCtr bottomNavCtr = Get.find();

    // Daftar menu tanpa pengecekan responsif
    final List<Widget> menus = [
      PostView(),
      Search(),
      Profile(),
    ];

    return Obx(() {
      return Scaffold(
        body: menus[bottomNavCtr.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavCtr.selectedIndex.value,
          onTap: bottomNavCtr.changeIndexMenu,
          selectedItemColor: Colors.blue, // Warna item yang dipilih
          unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
          backgroundColor: Colors.white, // Warna latar belakang BottomNavigationBar
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      );
    });
  }
}
