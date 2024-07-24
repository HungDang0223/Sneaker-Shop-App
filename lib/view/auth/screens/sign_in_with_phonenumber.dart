import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop_app/view/auth/screens/pin_input.dart';

import '../../../theme/custom_app_theme.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  final _phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nhập số điện thoại",
          style: AppThemes.appBarText(width),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Text(
              "Nhập số điện thoại để nhận mã xác thực",
              style: AppThemes.normalText(width),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                hintText: "Nhập số điện thoại",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12)
                ),
                prefixIcon: Container(
                  child: InkWell(
                    child: CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'VN',
                        favorite: ['+84','VN'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        // countryFilter: [AutofillHints.countryCode],
                        alignLeft: false,
                    ),
                  ),
                )
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: width / 1.2,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xff337ab7),
                borderRadius: BorderRadius.circular(20)
              ),
              child: InkWell(
                onTap: () {
                  log("fs");
                  Get.to(() => PinInputScreen());
                },
                child: Center(
                child: Text("Tiếp theo", style: AppThemes.logButton(width),
              ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}