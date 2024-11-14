import 'package:get/get.dart';
import 'package:project_qlbh/routes/routes_path/auth_routes.dart';
import 'package:project_qlbh/routes/routes_path/home_routes.dart';
import 'package:project_qlbh/routes/routes_path/profile_routes.dart';

class AppPages {
  static List<GetPage> list = [
    ...AuthRoutes.list,
    ...HomeRoutes.list,
    ...ProfileRoutes.list,
  ];
}
