import 'dart:convert';

class User {
  String uid;
  String userName;
  String email;
  String password;
  String userPhoto;

  User({
    required this.uid,
    required this.userName,
    required this.email,
    required this.password,
    required this.userPhoto
  });

  void setUser(User _user) {
    uid = _user.uid;
    userName = _user.userName;
    email = _user.email;
    password = _user.password;
    userPhoto = _user.userPhoto;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] ?? '',
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      userPhoto: json['userPhoto'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'email': email,
      'password': password,
      'userPhoto': userPhoto
    };
  }

  String toJson() => json.encode(toMap());
}
