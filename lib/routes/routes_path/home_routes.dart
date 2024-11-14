import 'package:get/get.dart';
import 'package:project_qlbh/screens/home/home_screen.dart';

class HomeRoutes {
  static const HOME = '/home';

  static List<GetPage> list = [
    GetPage(
      name: HOME,
      page: () {
        return HomeScreenPage();
      },
    )
  ];
}
