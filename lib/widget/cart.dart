import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop_app/view/bag/bag_screen.dart';
import 'package:sneaker_shop_app/view/bag/widget/body.dart';

import '../controller/navigator_controller.dart';

class CustomCart extends StatelessWidget {
  final quantityProductInCart;
  final _navController = Get.put(NavigatorController());

  CustomCart({super.key, this.quantityProductInCart});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      child: InkWell(
        onTap: () {
          // Get.to(() => MyBagScreen());
          _navController.selectedIndex.value = 1;
        },
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red
                ),
                child: Center(
                  child: Text(
                    quantityProductInCart.toString(),
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}