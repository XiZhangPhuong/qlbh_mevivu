import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_qlbh/screens/auth/login_controller.dart';
import 'package:project_qlbh/utils/color_resouce.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResouce.colorBackground,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Đăng nhập hệ thống',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // edit user name
            TextField(
              controller: loginController.userNameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: loginController.passWordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(
              () {
                return GestureDetector(
                  onTap: () {
                    loginController.login(
                        username: loginController.userNameController.text,
                        password: loginController.passWordController.text);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: loginController.isLoading.value == false
                          ? Text(
                              'Đăng nhập',
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )
                          : CircularProgressIndicator(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
