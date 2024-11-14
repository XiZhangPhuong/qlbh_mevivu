import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_qlbh/routes/app_routes.dart';
import 'package:project_qlbh/routes/routes_path/auth_routes.dart';
import 'package:project_qlbh/routes/routes_path/home_routes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quan Ly Ban Hang',
      getPages: AppPages.list,
      initialRoute: GetStorage().read('user') == null
          ? AuthRoutes.LOGIN
          : AuthRoutes.DASHBOARD,
    );
  }
}
