import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_qlbh/model/cart.dart';

class CartController extends GetxController {
  //
  CartResponse cartResponse = CartResponse();

  // biến loading call API
  var isLoading = false.obs;

  // Đường dẫn API
  String path = 'https://dummyjson.com/carts/1';

  @override
  void onInit() {
    super.onInit();
    //
    getDataCart();
  }

  // gọi dữ liệu cart từ API
  Future<void> getDataCart() async {
    try {
      isLoading.value = true;
      Dio dio = Dio();
      var response = await dio.get(path);
      if (response.statusCode == 200) {
        cartResponse = CartResponse.fromJson(response.data);
        isLoading.value = false;
      } else {
        print('Lỗi call API Cart');
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}
