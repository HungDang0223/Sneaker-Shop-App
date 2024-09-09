import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneaker_shop_app/firesbase/authentification/auth_service.dart';

import '../../data/models/comment.dart';

class CommentStorage {
  final _comments = FirebaseFirestore.instance.collection("comments");
  
  Future<void> addComment(String productId, String content) async {
    final _prefs = await SharedPreferences.getInstance();
    final uid = _prefs.getString('uid');
    // document sẽ lưu với id là productId
    final _cmtItems = _comments.doc(productId).collection("cmtItems");
    final cmt = <String, dynamic> {
      "productId": productId,
      "senderId": uid!,
      "sendingTime": DateTime.now(),
      "content": content,
      "rating": 5,
      "like": 0,
      "unlike": 0
    };

    try {
      // Kiểm tra product
      final snap = await _comments.where("productId", isEqualTo: productId).get();
      if (snap.docs.isEmpty) {
        await _cmtItems.doc().set(cmt);
      }
    } catch (e) {
      print("Add comment in product with id = $productId catch error: $e");
    }
  }

  Stream<List<Comment>> getProductComment(String productId) async* {
    final cmtsStream = await _comments.doc(productId).collection("cmtItems").orderBy("sendingTime", descending: true).snapshots();
    await for (var snapshot in cmtsStream) {
      try {
        final List<Comment> listComment = await Future.wait(
          snapshot.docs.map((cmtItem) async {
            return Comment.fromJson(cmtItem.data());
          }).toList());

        yield listComment;
      } catch (e) {
        print("get comment in product catch error: $e");
        yield [];
      }
    }
  }

}