import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_qlbh/screens/profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage('${profileController.userResponse.image!}'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Họ tên : ${profileController.userResponse.username!}',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Giới tính : ${profileController.userResponse.gender!}',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  profileController.logout();
                },
                child: Text(
                  'Đăng xuất',
                  style: GoogleFonts.nunito(color: Colors.red, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
