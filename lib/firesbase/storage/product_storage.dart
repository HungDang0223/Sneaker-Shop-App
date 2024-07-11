import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/shoe_model.dart';

class ProductStorage {
  final _product = FirebaseFirestore.instance.collection('products');

  Future<ShoeModel?> getProductById(String productId) async {
    try {
      QuerySnapshot query =
          await _product.where("id", isEqualTo: productId).get();

      if (query.docs.isNotEmpty) {
        return ShoeModel.fromJson(
            query.docs.first.data() as Map<String, dynamic>);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<String?> getproductFromFiretore() async {
    try {
      final res = await _product.get();
      return res.size.toString();
    } catch (e) {
      log("loi o day ne" + e.toString());
    }
    return "";
  }

  Future<List<ShoeModel>?> getProductFromFirestoreFilterByBrand(
      String brand) async {
    try {
      final res = await _product.where("brand", isEqualTo: brand).get();
      log("filter by brand catch error " + res.size.toString());
      final a = res.docs
          .map((product) => ShoeModel.fromJson(product.data()))
          .toList();
      log(a.length.toString());
      return a;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
