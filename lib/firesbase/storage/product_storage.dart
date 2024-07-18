import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/shoe_model.dart';

class ProductStorage {
  final _product = FirebaseFirestore.instance.collection('products');

  Future<ShoeModel> getProductById(String productId) async {
    final productDoc = await _product.doc(productId).get();
    if (!productDoc.exists) {
      throw Exception('Product not found for ID: $productId');
    }
    return ShoeModel.fromJson(productDoc.data()!);
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

      if (res.docs.isNotEmpty) {
        final listProducts = res.docs
            .map((product) => ShoeModel.fromJson(product.data()))
            .toList();
            
        return listProducts;
      } else log("ket qua bi rong");
    } catch (e) {
      log("lay san pham gap loi: "+e.toString());
    }
    return null;
  }
}
