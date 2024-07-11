import 'dart:convert';

class User {
  final String uid;
  final String username;
  final String email;
  final String password;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['id'] ?? '',
      username: json['userName'] ?? '',
      email: json['userEmail'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'userName': username,
      'userEmail': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
