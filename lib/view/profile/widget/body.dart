import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../animation/fadeanimation.dart';
import '../../../controller/sign_in_controller.dart';
import '../../../data/models/models.dart';
import '../../../../utils/constants.dart';
import '../../../../view/profile/widget/repeated_list.dart';
import '../../../data/dummy_data.dart';
import '../../../data/models/user.dart';
import '../../../firesbase/authentification/auth_service.dart';
import '../../../firesbase/storage/user_storage.dart';
import '../../../theme/custom_app_theme.dart';
import '../../auth/screens/sign_in.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  final _auth = AuthService();
  final UserController _userController = Get.put(UserController());
  final _user = UserCollection();

  int statusCurrentIndex = 0;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Obx(() => _userController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //topProfilePicAndName
                Container(
                  color: Color(0xff337ab7),
                  padding: const EdgeInsets.only(left: 10),
                  child: 
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text("Hồ sơ",
                                style: AppThemes.profileAppBarTitle(width)),
                            )
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.more_vert),
                                onPressed: () {},
                                color: Colors.white,
                              ),
                          )
                        ],
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                              image: DecorationImage(
                                image:  _userController.user.value.userPhoto == ""
                                          ? AssetImage("assets/images/avatar.png",)
                                          : NetworkImage(_userController.user.value.userPhoto) as ImageProvider,
                                  
                                  fit: BoxFit.cover)
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width / 1.7,
                              child: Text(
                                    _userController.user.value.userName,
                                    style: AppThemes.profileDevName(width),
                                  ),
                            ),
                            Text(
                              "Thành viên đồng",
                              style: AppThemes.semiLightText(width),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            size: width / 15,
                            Icons.edit_outlined,
                            color: Colors.white,
                          ))
                      ],
                    ),
                    SizedBox(height: 15,)
                  ]),
                ),
          
                // Tài khoản
                Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.grey[350]
                        ),
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Text(
                              "Tài khoản",
                              style: AppThemes.normalText(width),
                              )
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SettingItem(
                              width: width,
                              height: height,
                              leadingBackColor: Colors.green[600],
                              icon: Icons.wallet_travel_outlined,
                              title: "Thông tin tài khoản",
                              trailling: Icon(
                                Icons.arrow_forward_ios,
                                color: AppConstantsColor.darkTextColor,
                                size: width / 30,
                              ),
                            ),
                            SettingItem(
                              width: width,
                              height: height,
                              leadingBackColor: Colors.yellow[600],
                              icon: Icons.archive,
                              title: "Tài khoản / thẻ ngân hàng",
                              trailling: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppConstantsColor.darkTextColor,
                                  size: width / 30,
                                ),
                              ),
                            ),
                            SettingItem(
                              width: width,
                              height: height,
                              leadingBackColor: Colors.grey[400],
                              icon: Icons.location_on_outlined,
                              title: "Địa chỉ",
                              trailling: Icon(
                                Icons.arrow_forward_ios,
                                color: AppConstantsColor.darkTextColor,
                                size: width / 30,
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
          
                // Cài đặt
                Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.grey[350]
                        ),
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Text(
                              "Cài đặt",
                              style: AppThemes.normalText(width),
                              )
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SettingItem(
                              width: width,
                              height: height,
                              leadingBackColor: Colors.blue[600],
                              icon: Icons.notifications,
                              title: "Cài đặt thông báo",
                              trailling: Icon(
                                Icons.arrow_forward_ios,
                                color: AppConstantsColor.darkTextColor,
                                size: width / 30,
                              ),
                            ),
                            SettingItem(
                              width: width,
                              height: height,
                              leadingBackColor: Colors.orange[400],
                              icon: Icons.language_outlined,
                              title: "Ngôn ngữ / Language",
                              trailling: Icon(
                                Icons.arrow_forward_ios,
                                color: AppConstantsColor.darkTextColor,
                                size: width / 30,
                              ),
                            ),
                            SettingItem(
                              width: width,
                              height: height,
                              leadingBackColor: Colors.grey[600],
                              icon: isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                              title: "Chủ đề",
                              trailling: Row(
                                children: [
                                  Container(
                                  child: Text(
                                    isDarkMode ? "Tối" : "Sáng",
                                    style: AppThemes.normalText(width),
                                  ),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppConstantsColor.darkTextColor,
                                    size: width / 30,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
          
                // bottomSection
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.grey[350]
                        ),
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Text(
                              "Bảng điều khiển",
                              style: AppThemes.normalText(width),
                              )
                        )),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Chuyển tài khoản",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue[500],
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _signOut();
                                      print("log out");
                                    },
                                    child: Text(
                                      "Đăng xuất",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red[500],
                                          fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(height: 5,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _signOut() async {
    log("log out");
    await _auth.signOut();
    Get.to(const SigninScreen());
  }

  void getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final res = await _user.getUserByID(uid!);
    if (res != null) {
      final user = User.fromJson(res);
      _userController.setUser(user);
      _userController.isLoading.value = false;
    } else {
      log("user null");
    }
  }
}
