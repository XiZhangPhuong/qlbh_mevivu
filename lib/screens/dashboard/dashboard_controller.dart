import 'package:get/get.dart';

class DashBoardController extends GetxController {
  // gán biến
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // chuyển đổi màn hình
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
