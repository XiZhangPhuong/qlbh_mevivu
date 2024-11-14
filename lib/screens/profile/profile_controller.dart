import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_qlbh/model/user.dart';
import 'package:project_qlbh/routes/routes_path/profile_routes.dart';

class ProfileController extends GetxController {
  //
  final box = GetStorage();

  //
  UserResponse userResponse = UserResponse();
  @override
  void onInit() {
    super.onInit();

    //
    getDataUser();
  }

  // lấy dữ liệu user local storage
  void getDataUser() {
    userResponse = UserResponse.fromJson(box.read('user'));
  }

  // đăng xuất
  void logout() {
    Get.dialog(
      AlertDialog(
        title: Text('Log Out'),
        content: Text('Bạn có muốn đăng xuất hay không ?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Hủy bỏ'),
          ),
          TextButton(
            onPressed: () {
              // xóa dữ liệu user khởi local
              box.remove('user');
              Get.offAllNamed(ProfileRoutes.LOGIN);
            },
            child: Text('Đồng ý'),
          ),
        ],
      ),
    );
  }
}
