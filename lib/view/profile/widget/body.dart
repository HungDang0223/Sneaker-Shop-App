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
import '../../../firesbase/authentification/auth_service.dart';
import '../../../firesbase/storage/user_storage.dart';
import '../../../theme/custom_app_theme.dart';
import '../../log/widget/sign_in.dart';

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
  final SignInController _signinController = Get.put(SignInController());
  final _user = UserCollection();

  int statusCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Obx(() => _signinController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  //topProfilePicAndName
                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: width / 11,
                            backgroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/91388754?v=4"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width / 1.8,
                                child: Obx(() => Text(
                                      _signinController.username.value,
                                      style: AppThemes.profileDevName(width),
                                    )),
                              ),
                              Text(
                                "Flutter Developer",
                                style: AppThemes.semiLightText(width),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                size: width / 15,
                                Icons.edit_outlined,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // StatusListView
                  FadeAnimation(
                    delay: 1.5,
                    child: Container(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "My Status",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Container(
                              width: width / 1.15,
                              height: height / 14,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: userStatus.length,
                                  itemBuilder: (ctx, index) {
                                    UserStatus status = userStatus[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          statusCurrentIndex = index;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          margin: const EdgeInsets.all(5),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: statusCurrentIndex == index
                                                ? status.selectColor
                                                : status.unSelectColor,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                status.emoji,
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                status.txt,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: AppConstantsColor
                                                        .lightTextColor,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Dashboard
                  FadeAnimation(
                    delay: 2,
                    child: Container(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: const Text(
                                "Dashboard",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 15),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          SettingItem(
                            width: width,
                            height: height,
                            leadingBackColor: Colors.green[600],
                            icon: Icons.wallet_travel_outlined,
                            title: "Payments",
                            trailling: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[700],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "2 New",
                                    style: AppThemes.lightWhiteText(width),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppConstantsColor.lightTextColor,
                                    size: width / 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SettingItem(
                            width: width,
                            height: height,
                            leadingBackColor: Colors.yellow[600],
                            icon: Icons.archive,
                            title: "Achievement's",
                            trailling: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppConstantsColor.darkTextColor,
                                    size: width / 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SettingItem(
                            width: width,
                            height: height,
                            leadingBackColor: Colors.grey[400],
                            icon: Icons.shield,
                            title: "Privacy",
                            trailling: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red[500],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Action Needed",
                                      style: AppThemes.lightWhiteText(width)),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppConstantsColor.lightTextColor,
                                    size: width / 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // bottomSection
                  FadeAnimation(
                    delay: 2.5,
                    child: Container(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "My Account",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Switch to Other Account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue[600],
                                      fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _signOut;
                                  },
                                  child: Text(
                                    "Log Out",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red[500],
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
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
    Get.to(SigninScreen());
  }

  void getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final user = await _user.getUserByID(uid!);
    if (user != null) {
      _signinController.setUserName(user["username"]);
      _signinController.isLoading.value = false;
      log(user["username"]);
    } else {
      log("user null");
    }
  }
}
