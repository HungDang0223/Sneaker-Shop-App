import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop_app/view/log/widget/sign_in.dart';

import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
    backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
      backgroundColor: Color(0xfff2f2f2),
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: w / 20,
              color: AppConstantsColor.hightlightTextColor,
            )),
        title: Text("Đăng ký", style: AppThemes.logAppBarTitle(w),),
      ),
      body: Container(
        child: Column(
          children: [
            Positioned(
              bottom: 0,
              left: w/5,
              child: Text(
                "Đăng ký",
                style: AppThemes.logTitle(w),
            )
            ),
            SizedBox(height: h/14,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Container(
                    height: h/13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Tên người dùng",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: h/13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Email hoặc số điện thoại",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: h/13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Mật khẩu",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: h/12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ]
                      )
                    ),
                    child: Text(
                      "Đắng ký",
                      style: AppThemes.logButton(w)
                    ),
                  ),
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bạn đã có tài khoản?", style: AppThemes.lightText(w),),
                      SizedBox(width: 4,),
                      GestureDetector(
                        onTap: () {
                          Get.to(SigninScreen());
                        },
                        child: Text("Đăng nhập", style: TextStyle(
                            fontSize: w/26,
                            color: Color.fromRGBO(143, 148, 251, 1)),),
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
}