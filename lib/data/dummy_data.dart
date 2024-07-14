import 'package:flutter/material.dart';

import 'models/models.dart';

final List<ShoeModel> availableShoes = [
  ShoeModel(
    productId: "1",
    brand: "NIKE",
    model: "AIR MAX",
    price: 130.00,
    imgAddress: "assets/images/nike1.png",
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/sneaker-shoes-shop.appspot.com/o/shoes%2Fnike%2Fnike1.png?alt=media",
    modelColor: const Color(0xffDE0106),
    mainColor: '',
  ),
  ShoeModel(
    productId: "1",
    brand: "NIKE",
    model: "AIR JORDAN MID",
    price: 190.00,
    imgAddress: "assets/images/nike8.png",
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/sneaker-shoes-shop.appspot.com/o/shoes%2Fnike%2Fnike8.png?alt=media",
    modelColor: const Color(0xff3F7943),
    mainColor: '',
  ),
  ShoeModel(
    productId: "1",
    brand: "NIKE",
    model: "ZOOM",
    price: 160.00,
    imgAddress: "assets/images/nike2.png",
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/sneaker-shoes-shop.appspot.com/o/shoes%2Fnike%2Fnike2.png?alt=media",
    modelColor: const Color(0xffE66863),
    mainColor: '',
  ),
  ShoeModel(
    productId: "1",
    brand: "NIKE",
    model: "Air FORCE",
    price: 110.00,
    imgAddress: "assets/images/nike3.png",
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/sneaker-shoes-shop.appspot.com/o/shoes%2Fnike%2Fnike3.png?alt=media",
    modelColor: const Color(0xffD7D8DC),
    mainColor: '',
  ),
  ShoeModel(
    productId: "1",
    brand: "NIKE",
    model: "AIR JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike5.png",
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/sneaker-shoes-shop.appspot.com/o/shoes%2Fnike%2Fnike5.png?alt=media",
    modelColor: const Color(0xff37376B),
    mainColor: '',
  ),
  ShoeModel(
    productId: "1",
    brand: "NIKE",
    model: "ZOOM",
    price: 115.00,
    imgAddress: "assets/images/nike4.png",
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/sneaker-shoes-shop.appspot.com/o/shoes%2Fnike%2Fnike4.png?alt=media",
    modelColor: const Color(0xffE4E3E8),
    mainColor: '',
  ),
  ShoeModel(
    productId: "1",
    brand: "NIKE",
    model: "AIR JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike7.png",
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/sneaker-shoes-shop.appspot.com/o/shoes%2Fnike%2Fnike7.png?alt=media",
    modelColor: const Color(0xffD68043),
    mainColor: '',
  ),
  ShoeModel(
    productId: "1",
    brand: "NIKE",
    model: "AIR JORDAN LOW",
    price: 150.00,
    imgAddress: "assets/images/nike6.png",
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/sneaker-shoes-shop.appspot.com/o/shoes%2Fnike%2Fnike6.png?alt=media",
    modelColor: const Color(0xffE2E3E5),
    mainColor: '',
  ),
];

List<ShoeModel> itemsOnBag = [];

final List<UserStatus> userStatus = [
  UserStatus(
    emoji: '😴',
    txt: "Away",
    selectColor: const Color(0xff121212),
    unSelectColor: const Color(0xffbfbfbf),
  ),
  UserStatus(
    emoji: '💻',
    txt: "At Work",
    selectColor: const Color(0xff05a35c),
    unSelectColor: const Color(0xffCEEBD9),
  ),
  UserStatus(
    emoji: '🎮',
    txt: "Gaming",
    selectColor: const Color(0xffFFD237),
    unSelectColor: const Color(0xffFDDFBB),
  ),
  UserStatus(
    emoji: '🤫',
    txt: "Busy",
    selectColor: const Color(0xffba3a3a),
    unSelectColor: const Color(0xffdb9797),
  ),
];

final List categories = [
  'Nike',
  'Adidas',
  'Jordan',
  'Puma',
  'Gucci',
  'Tom Ford',
  'Koio',
];
final List featured = [
  'New',
  'Featured',
  'Upcoming',
];

final sizes = [33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45];
