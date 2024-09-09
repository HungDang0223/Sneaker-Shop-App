import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sneaker_shop_app/data/models/user.dart';


class UserCollection {
  final _user = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(Map<String, dynamic> data) async {
    await _user.add(data);
  }

  Future<User?> getUserByID(String id) async {
    try {

      QuerySnapshot query = await _user.where("uid", isEqualTo: id).get();
      
      if (query.docs.isNotEmpty) {
        return User.fromJson(query.docs.first.data() as Map<String, dynamic>);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> updateUser() async {

  }
}

