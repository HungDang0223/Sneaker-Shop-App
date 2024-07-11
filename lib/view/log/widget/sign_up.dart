import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        backgroundColor: Color(0xfff2f2f2),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: width/ 18,
              color: AppConstantsColor.hightlightTextColor,
            )),
        title: Text(
          "Đăng ký",
          style: AppThemes.logAppBarTitle(width),
        ),
      ),
      body: Container(
        child: Column(
          children: [
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
                    height: height / 13,
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
                    height: height / 13,
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
                    height: height / 13,
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
                      height: height / 13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
          ],
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
}
