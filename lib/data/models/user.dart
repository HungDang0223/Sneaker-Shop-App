import 'dart:convert';

class User {
  String uid;
  String userName;
  String email;
  String password;
  String userPhoto;
  String address;

  User({
    required this.uid,
    required this.userName,
    required this.email,
    required this.password,
    required this.userPhoto,
    required this.address
  });

  void setUser(User _user) {
    uid = _user.uid;
    userName = _user.userName;
    email = _user.email;
    password = _user.password;
    userPhoto = _user.userPhoto;
    address = "";
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] ?? '',
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      userPhoto: json['userPhoto'] ?? '',
      address: json['address'] ?? ''
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'email': email,
      'password': password,
      'userPhoto': userPhoto,
      'address': address
    };
  }

  String toJson() => json.encode(toMap());
}
