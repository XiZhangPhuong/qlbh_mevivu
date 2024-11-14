import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_qlbh/model/product_.dart';

class HomeController extends GetxController {
  // đường dẫn api product
  String path = 'https://dummyjson.com/products';

  //
  var isLoading = false.obs;

  //
  ProductResponse productResponse = ProductResponse();

  //
  List<String> listCategory = [];
  @override
  void onInit() {
    super.onInit();
    getDataProduct();
  }

  // get data product
  Future<void> getDataProduct() async {
    try {
      isLoading.value = true;
      Dio dio = Dio();
      var response = await dio.get(path);
      if (response.statusCode == 200) {
        productResponse = ProductResponse.fromJson(response.data);
        for (var i in productResponse.products!) {
          listCategory.add(i.category!);
        }
        Set<String> set = listCategory.toSet();
        listCategory = set.toList();
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }
}
