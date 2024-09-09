import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sneaker_shop_app/controller/sign_in_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool showPassword = false;
  Uint8List imageBytes = Uint8List(0);
  final _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(143, 148, 251, 1),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color.fromRGBO(143, 148, 251, 1),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Chỉnh sửa hồ sơ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageBytes.isEmpty
                                  ? _userController.user.value.userPhoto == ""
                                    ? AssetImage("assets/images/avatar.png",)
                                    : NetworkImage(_userController.user.value.userPhoto) as ImageProvider
                                  : MemoryImage(imageBytes),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Color.fromRGBO(143, 148, 251, 1),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Tên người dùng", _userController.user.value.userName, false),
              buildTextField("Email", _userController.user.value.email, false),
              buildTextField("Mật khẩu", showPassword ? _userController.user.value.password : "******", true),
              buildTextField("Số điện thoại", "", false),
              buildTextField("Địa chỉ", "", false),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("CANCEL",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black)),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(143, 148, 251, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white),
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

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        maxHeight: 1000,
        maxWidth: 1000,
        source: ImageSource.gallery
    );
    if (pickedImage != null) {
      XFile? imageFile = XFile(pickedImage.path);
      imageBytes = await imageFile.readAsBytes();

    }
  }
}
