import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop_app/view/auth/screens/sign_in_with_phonenumber.dart';
import 'package:sneaker_shop_app/view/navigator.dart';

import '../../../firesbase/authentification/auth_service.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';
import 'sign_in.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
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
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      // appBar: AppBar(
      //   backgroundColor: Color(0xfff2f2f2),
      //   elevation: 0,
      //   leading: IconButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       icon: Icon(
      //         Icons.arrow_back,
      //         size: width/ 18,
      //         color: AppConstantsColor.hightlightTextColor,
      //       )),
      //   title: Text(
      //     "Đăng ký",
      //     style: AppThemes.logAppBarTitle(width),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                child: Text(
                  "Đăng ký",
                  style: AppThemes.logTitle(width),
              )),
              SizedBox(
                height: height / 14,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 30,
                    ),
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
                            hintText: "Email hoặc số điện thoại",
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
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Xác nhận mật khẩu",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        _signup();
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: height / 14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: Text("Đăng ký", style: AppThemes.logButton(width)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bạn đã có tài khoản?",
                          style: AppThemes.lightBlackText(width),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SigninScreen());
                          },
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                                fontSize: width/ 26,
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Hoặc"),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(LoginWithPhoneNumber());
                    },
                    child: Container(
                      width: width / 1.2,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.phone_iphone_outlined, size: 22,),
                          Expanded(
                            child: Center(
                              child: Text(
                                "Tiếp tục bằng số điện thoại",
                                style: AppThemes.boldText(width),
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      _signinWithGoogle();
                    },
                    child: Container(
                      width: width / 1.2,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            height: 20,
                            width: 20,
                          ),
                          Expanded(
                            child: Center(
                              child: Text("Tiếp tục với Google", style: AppThemes.boldText(width),)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _auth.signInWithGoogle();
                    },
                    child: Container(
                      width: width / 1.2,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/facebook.png",
                            height: 20,
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text("Tiếp tục với Facebook", style: AppThemes.boldText(width),)
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _signup() async {
    final res = await _auth.createUserWithEmailAndPassword(
        _emailController.text, _passwordController.text);
    if (res != null) {
      log("Create account success");
      Get.to(SigninScreen());
    } else {
      log("Create faild");
    }
  }
  _signinWithGoogle() async {
    final res = await _auth.signInWithGoogle();
    if (res != null) {
      log("Sign in with google success");
      Get.offAll(MainNavigator());
    } else {
      log("Sign in with google failed");
    }
  }
}
