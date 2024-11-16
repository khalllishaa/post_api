import 'package:apii/makeupp/PostControllerr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostVieww extends StatelessWidget {
  final PostControllerr postControllerr = Get.put(PostControllerr());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validasi apakah semua field terisi
                if (usernameController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    fullNameController.text.isEmpty ||
                    emailController.text.isEmpty) {
                  postControllerr.registerStatus.value = 'All fields are required';
                } else {
                  // Panggil registerUser saat tombol register ditekan
                  postControllerr.registerUser(
                    usernameController.text,
                    passwordController.text,
                    fullNameController.text,
                    emailController.text,
                  );
                }
              },
              child: Text('Register'),
            ),
            Obx(() {
              // Tampilkan status registrasi
              return Text(postControllerr.registerStatus.value);
            }),
          ],
        ),
      ),
    );
  }
}
