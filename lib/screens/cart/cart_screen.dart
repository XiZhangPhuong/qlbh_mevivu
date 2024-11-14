import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_qlbh/screens/cart/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          'Giỏ hàng của bạn',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Obx(
        () {
          return cartController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _cart(cartController);
        },
      ),
    );
  }
}

// giỏ hàng
Widget _cart(CartController cartController) {
  return cartController.cartResponse.products!.isEmpty
      ? Center(
          child: Text('Giỏ hàng của bạn trôngs'),
        )
      : Container(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cartController.cartResponse.products!.length,
                  itemBuilder: (context, index) {
                    var item = cartController.cartResponse.products![index];
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 0.5,
                        child: ListTile(
                          leading: Image.network(
                            item.thumbnail!,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item.title!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'x${item.quantity!}',
                              ),
                              Row(
                                children: [
                                  Text(
                                    item.price!.toString(),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 0.5, color: Colors.black),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.remove,
                                            size: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${item.quantity!}',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.add,
                                            size: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          isThreeLine: true,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng tiền : ',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      cartController.cartResponse.total!.toString(),
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                // button thanh toán
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        'Thanh toán',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
