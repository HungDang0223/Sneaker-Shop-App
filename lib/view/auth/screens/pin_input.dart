import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../theme/custom_app_theme.dart';

class PinInputScreen extends StatefulWidget {
  const PinInputScreen({super.key});

  @override
  State<PinInputScreen> createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {

  final _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nhập mã xác thực",
          style: AppThemes.appBarText(width),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Text(
              "Mã xác thực được gửi qua tin nhắn của số điện thoại",
              style: AppThemes.normalText(width),
            ),
            Text("(+84) 964 930 757"),
            SizedBox(height: 15,),
            Pinput(
              length: 6,
              showCursor: true,
              defaultPinTheme: PinTheme(
                width: 50,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xff337ab7))
                ),
                textStyle: AppThemes.superBoldText(width)
              ),
              // onSubmitted: (value) {
              //   log(value);
              // },
              onCompleted:(value) {
                log(value);
              },
            )
          ],
        ),
      ),
    );
  }
}