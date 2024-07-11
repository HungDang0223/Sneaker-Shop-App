import 'dart:convert';

import 'package:flutter/material.dart';

class ShoeModel {
  String productId;
  String brand;
  String model;
  double price;
  String imgAddress;
  String imgUrl;
  Color modelColor;
  String mainColor;

  ShoeModel({
    required this.productId,
    required this.brand,
    required this.model,
    required this.price,
    required this.imgAddress,
    required this.imgUrl,
    required this.mainColor,
    required this.modelColor,
  });

  factory ShoeModel.fromJson(Map<String, dynamic> json) {
    return ShoeModel(
        productId: json['productId'] ?? '',
        brand: json['brand'] ?? '',
        model: json['model'] ?? '',
        price: json['price'] ?? '',
        imgAddress: '',
        imgUrl: json['price'] ?? '',
        mainColor: json['mainColor'] ?? '',
        modelColor: Color(int.parse("0xff$json['modelColor']")));
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'brand': brand,
      'model': model,
      'price': price,
      'imgAddress': imgAddress,
      'imgUrl': imgUrl,
      'modelColor': modelColor,
      'mainColor': mainColor
    };
  }

  String toJson() {
    return json.encode(toMap());
  }
}
