import 'dart:developer';
import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneaker_shop_app/data/models/shoe_model.dart';
import 'package:sneaker_shop_app/firesbase/storage/product_storage.dart';

class Cart {

  final _cart = FirebaseFirestore.instance.collection("cart");

  Future<void> addToCart(
    ShoeModel productInfo,
    int size,
    int quantity
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    // Tham chiếu tới items tương ứng với document có id là uid
    final _items = _cart.doc(uid).collection("items");
    final product = {
      "productId": productInfo.productId,
      "price": productInfo.price,
      "modelColor": "#${productInfo.modelColor.value.toRadixString(16).substring(2)}",
      "size": size,
      "quantity": quantity
    };

    try {
      // Kiểm tra sản phầm đã có trong giỏ hàng chưa
    QuerySnapshot snap = await _items.where("productId", isEqualTo: productInfo.productId).get();
    // Nếu chưa thì thêm vào items
    // Nếu có rồi thì tăng số lượng
    // Note: document id trong items la id cua san pham
    if (snap.docs.isEmpty) {
      await _items.doc(productInfo.productId).set(product);
    } else {
      final previousQuantity = (snap.docs.first.data() as Map<String, dynamic>)["quantity"];
      _items.doc(productInfo.productId).update({"quantity": previousQuantity + quantity})
      .catchError((error) {
        print("Add to cart catch error: $error");
      });

    }
    } catch (e) {
      print("Add to cart catch err: $e");
    }
  }

  Future<List<Map<String, dynamic>>?> getProductByUID() async {
    final prefs = await SharedPreferences.getInstance();
    final _productStorage = ProductStorage();

    final uid = prefs.getString('uid');
    try {
      final _items = await _cart.doc(uid).collection("items").get();
    final List<Map<String, dynamic>> listCartItem = await Future.wait(
      _items.docs.map((cartItem) async {
        final cartItemData = cartItem.data();
        final product = await _productStorage.getProductById(cartItemData["productId"]);
        return {
          "product": product,
          "quantity": cartItemData["quantity"],
          "size": cartItemData["size"]
        };
      }).toList(),);
    return listCartItem;
    } catch (e) {
      print("lay san pham trong gio hang gap loi $e");
    }
    return null;
  }
}