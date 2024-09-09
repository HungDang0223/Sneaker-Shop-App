import 'dart:convert';

class Comment {
  final String productId;
  final String senderId;
  final String content;
  DateTime sendingTime = DateTime.now();
  int rating=5;
  int like=0;
  int unlike=0;

  Comment({required this.productId, required this.senderId, required this.content, sendingTime, rating, like, unlike});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        productId: json["productId"] ?? "",
        senderId: json["senderId"] ?? "",
        content: json["content"] ?? "",
        sendingTime: json["sendingTime"],
        rating: json["rating"] ?? 5,
        like: json["like"] ?? 0,
        unlike: json['unlike'] ?? 0
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "productId_uid": productId,
      "senderId": senderId,
      "content": content,
      "sendingTime": sendingTime,
      "rating": rating,
      "like": like,
      "unlike": unlike
    };
  }

  String toJson() => jsonEncode(toMap());
}