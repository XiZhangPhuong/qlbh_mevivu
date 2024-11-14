import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_qlbh/model/posts.dart';

class PostController extends GetxController {
  //
  PostResponse postResponse = PostResponse();

  //
  var isLoading = false.obs;

  //
  String path = 'https://dummyjson.com/posts';

  @override
  void onInit() {
    super.onInit();
    getDataPosts();
  }

  // get data posts
  Future<void> getDataPosts() async {
    try {
      isLoading.value = true;
      Dio dio = Dio();
      var response = await dio.get(path);
      if (response.statusCode == 200) {
        postResponse = PostResponse.fromJson(response.data);
        isLoading.value = false;
      } else {
        print('Call API Post Loi');
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
