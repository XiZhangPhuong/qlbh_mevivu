import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_qlbh/screens/home/home_controller.dart';
import 'package:project_qlbh/utils/color_resouce.dart';

class HomeScreenPage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResouce.colorBackground,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          'Mevivu Store',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Obx(
        () {
          return homeController.isLoading.value == false
              ? Container(
                  padding: EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _txtDanhMucc(),

                        SizedBox(
                          height: 10,
                        ),
                        _listDanhMuc(homeController),

                        //
                        SizedBox(
                          height: 10,
                        ),
                        _slideImage(homeController),
                        SizedBox(
                          height: 10,
                        ),
                        _recomment(),

                        SizedBox(
                          height: 10,
                        ),
                        //
                        _listViewProduct(homeController),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

// list danh muc
  Widget _listDanhMuc(HomeController homeController) {
    return Container(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeController.listCategory.length,
        itemBuilder: (context, index) {
          final item = homeController.listCategory[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 5),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5, color: Colors.blue),
              ),
              child: Center(
                child: Text(
                  '${item.toString()}',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

//
  Widget _txtDanhMucc() {
    return Text(
      'Danh mục',
      style: GoogleFonts.nunito(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _recomment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Sản phẩm mới',
          style: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Show All',
          style: GoogleFonts.nunito(
            color: Colors.red,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

// slide image
Widget _slideImage(HomeController homeController) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      gradient: LinearGradient(
        colors: [Colors.blue.withOpacity(0.3), Colors.red.withOpacity(0.3)],
      ),
    ),
    child: CarouselSlider.builder(
      itemCount: homeController.productResponse.products!.length,
      itemBuilder: (context, index, realIndex) {
        final item = homeController.productResponse.products![index];
        return Image.network(item.thumbnail!);
      },
      options: CarouselOptions(
        autoPlay: true,
        onPageChanged: (index, reason) {},
      ),
    ),
  );
}

// listview
Widget _listViewProduct(HomeController homeController) {
  return Container(
    height: 200,
    child: ListView.builder(
      itemCount: homeController.productResponse.products!.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = homeController.productResponse.products![index];
        return GestureDetector(
          onTap: () {},
          child: Container(
            width: 150,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 0.5,
                color: Colors.blue,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  item.thumbnail!,
                  width: 100,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  item.title!,
                  maxLines: 2,
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${item.price!.toString()}',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
