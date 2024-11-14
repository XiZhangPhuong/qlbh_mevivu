import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_qlbh/model/user.dart';
import 'package:project_qlbh/routes/routes_path/auth_routes.dart';

class LoginController extends GetxController {
  // txt username
  TextEditingController userNameController =
      TextEditingController(text: 'emilys');

  // txt password
  TextEditingController passWordController =
      TextEditingController(text: 'emilyspass');

  // đường dẫn api POST Login
  String pathLogin = "https://dummyjson.com/auth/login";

  // String username = "emilys";
  // String password = "emilyspass";

  // trạng thái đăng nhập
  var isLoading = false.obs;

  //
  UserResponse userResponse = UserResponse();

  //
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  // chức năng đăng nhập
  Future<void> login(
      {required String username, required String password}) async {
    try {
      isLoading.value = true;
      var data = {
        "username": username,
        "password": password,
      };
      Dio dio = Dio();
      var response = await dio.post(pathLogin, data: data);
      if (response.statusCode == 200) {
        userResponse = UserResponse.fromJson(response.data);
        isLoading.value = false;
        Get.snackbar('Thông báo', 'Đăng nhập thành công');
        Get.offAllNamed(AuthRoutes.DASHBOARD);
        // lưu dữ liệu user vào local storage
        box.write('user', userResponse.toJson());
      } else {
        // đăng nhập thất bại
        Get.snackbar('Đăng nhập thất bại', 'Sai tài khoản hoặc mật khẩu');
        isLoading.value = false;
      }
    } catch (e) {
      print('Lỗi đăng nhập ${e}');
      isLoading.value = false;
    }
  }
}
