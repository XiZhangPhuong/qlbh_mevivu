import 'package:get/get.dart';
import 'package:project_qlbh/screens/auth/login_screen.dart';

class ProfileRoutes {
  static String LOGIN = '/login';
  static List<GetPage> list = [
    GetPage(
      name: LOGIN,
      page: () => LoginScreen(),
    ),
  ];
}
