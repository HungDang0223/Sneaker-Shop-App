import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';


class UserCollection {
  final _user = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(Map<String, dynamic> data) async {
    await _user.add(data);
  }

  Future<Map<String, dynamic>?> getUserByID(String id) async {
    try {

      QuerySnapshot query = await _user.where("uid", isEqualTo: id).get();
      
      if (query.docs.isNotEmpty) {
        return query.docs.first.data() as Map<String, dynamic>;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

