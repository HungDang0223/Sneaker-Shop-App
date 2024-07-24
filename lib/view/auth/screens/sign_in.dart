import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop_app/widget/my_text_field.dart';

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
  final _controller = Get.put(UserController());

  final _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
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
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      height: height / 9,
                      alignment: Alignment.center,
                      child: MyTextField(
                          controller: _emailController,
                          hintText: "Nhập email của bạn",
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Email không được để trống.";
                            }
                            if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(e)) {
                              return "Email không hợp lệ.";
                            }
                            return null;
                          },
                          // errorMsg: "loi oi",
                        ),
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
                        if (_formKey.currentState!.validate()) {
                          log("sss");
                        };
                        _controller.user.value.email = _emailController.text;
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
            ),
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
      Get.off(MainNavigator());
    } else {
      log("Sign in failed");
    }
  }
}
