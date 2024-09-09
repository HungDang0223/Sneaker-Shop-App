import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneaker_shop_app/firesbase/storage/user_storage.dart';

import '../../../controller/sign_in_controller.dart';
import '../../../data/models/comment.dart';
import '../../../data/models/user.dart';
import '../../../theme/custom_app_theme.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  CommentItem({super.key, required this.comment});

  final UserController _userController = Get.put(UserController());
  final _userCollection = UserCollection();

  @override
  Widget build(BuildContext context) {
    final uid = comment.senderId;
    final _user = _userController.user.value;
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image:  _user.userPhoto == ""
                          ? AssetImage("assets/images/avatar.png",)
                          : NetworkImage(_user.userPhoto) as ImageProvider,
                      fit: BoxFit.cover)
              ),
            ),
            SizedBox(width: 10,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_user.userName.substring(0, 20),
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(comment.rating.toString()),
                        Text(comment.content,
                          style: TextStyle(
                            fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.thumb_up_outlined, size: 10,)),
                            Text(comment.like.toString())
                          ],
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.thumb_down_alt_outlined, size: 10,)),
                            Text(comment.unlike.toString())
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),

            InkWell(
              onTap: () {},
              child: Icon(Icons.more_vert_outlined),
            )
          ],
        ),
    );
  }

}
