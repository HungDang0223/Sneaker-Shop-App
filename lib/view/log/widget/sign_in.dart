import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/sign_in_controller.dart';
import '../../../firesbase/authentification/auth_service.dart';
import '../../../theme/custom_app_theme.dart';
import '../../navigator.dart';
import 'sign_up.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _controller = Get.put(SignInController());

  final _auth = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: height / 10,
              ),
              Container(
                child: Text(
                  "Đăng nhập",
                  style: AppThemes.logTitle(width),
                ),
              ),
              SizedBox(
                height: height / 14,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      height: height / 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Email hoặc Số điện thoại",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height / 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Mật khẩu",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          child: Text(
                            "Quên mật khẩu?",
                            style: TextStyle(
                                fontSize: width / 26,
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _controller.getInputEmail(_emailController.text);
                        _signin();
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: height / 14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: Text(
                          "Đăng nhập",
                          style: AppThemes.logButton(width),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bạn chưa có tài khoản?",
                          style: AppThemes.lightBlackText(width),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SignupScreen());
                          },
                          child: Text(
                            "Đăng ký ngay",
                            style: TextStyle(
                                fontSize: width / 26,
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Hoặc đăng nhập với"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _auth.signInWithGoogle();
                    },
                    child: Container(
                      height: width / 5,
                      width: width / 5,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15),
                        // border: Border.all(
                        //   color: Colors.white,
                        // )
                      ),
                      child: Container(
                        child: Image.asset(
                          "assets/images/google.png",
                          // fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _auth.signInWithGoogle();
                    },
                    child: Container(
                      height: width / 5,
                      width: width / 5,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Container(
                        child: Image.asset(
                          "assets/images/facebook.png",
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _signin() async {
    final res = await _auth.signinWithEmailAndPassword(
        _emailController.text, _passwordController.text);
    if (res != null) {
      log("sign in success");
      Get.to(MainNavigator());
    } else {
      log("Sign in failed");
    }
  }
}
