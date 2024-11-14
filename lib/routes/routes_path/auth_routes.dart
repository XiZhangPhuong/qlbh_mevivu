import 'package:get/get.dart';
import 'package:project_qlbh/screens/auth/login_screen.dart';
import 'package:project_qlbh/screens/dashboard/dashboard_screen.dart';

class AuthRoutes {
  static const LOGIN = '/login';
  static const DASHBOARD = '/dashboard';

  static List<GetPage> list = [
    GetPage(
      name: LOGIN,
      page: () {
        return LoginScreen();
      },
    ),
    GetPage(
      name: DASHBOARD,
      page: () {
        return DashBoardScreen();
      },
    ),
  ];
}
