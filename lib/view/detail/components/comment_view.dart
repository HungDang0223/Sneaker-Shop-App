import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop_app/firesbase/storage/comments.dart';
import 'package:sneaker_shop_app/view/detail/components/empty_comment_view.dart';

import '../../../controller/sign_in_controller.dart';
import '../../../data/models/shoe_model.dart';
import '../../../firesbase/authentification/auth_service.dart';
import '../../../theme/custom_app_theme.dart';
import '../widget/comment.dart';
import 'package:sneaker_shop_app/data/models/comment.dart';

class CommentView extends StatefulWidget {
  final double width, height;
  final ShoeModel model;
  const CommentView({super.key, required this.width, required this.height, required this.model});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  final TextEditingController _cmtEditingController = TextEditingController();
  final AuthService _auth = AuthService();
  final UserController _userController = Get.put(UserController());
  final _commentStorage = CommentStorage();

  @override
  void initState() {
    super.initState();
    _cmtEditingController.addListener(() {
      setState(() {}); // Triggers UI update when text changes
    });
  }

  @override
  void dispose() {
    _cmtEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: widget.width,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bình luận",
              style: AppThemes.superBoldText(widget.width),
            ),
            SizedBox(height: 15),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _userController.user.value.userPhoto == ""
                            ? AssetImage("assets/images/avatar.png")
                            : NetworkImage(_userController.user.value.userPhoto)
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(1, 1)
                            )]
                          ),
                          child: TextField(
                            controller: _cmtEditingController,
                            decoration: InputDecoration(
                              hintMaxLines: 2,
                              hintText: " Nhập bình luận...",
                              hintStyle: AppThemes.hintText(widget.width),
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                _cmtEditingController.clear();
                              },
                              child: Text(
                                "Hủy",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Opacity(
                              opacity:
                                  _cmtEditingController.text.isEmpty ? 0.4 : 1,
                              child: InkWell(
                                onTap: _cmtEditingController.text.isEmpty
                                    ? null
                                    : () {
                                        print("tap tap ${widget.model.productId}");
                                        _commentStorage.addComment(widget.model.productId, _cmtEditingController.text);
                                        _cmtEditingController.clear();
                                      },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 13),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Text(
                                    "Đăng",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: widget.height/1.4,
              child: StreamBuilder(
                  stream: _commentStorage.getProductComment(widget.model.productId),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong!!!");
                    } else if (snapshot.hasData) {
                      List<Comment> listComment = snapshot.data!;
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: listComment.length,
                        itemBuilder: (ctx, index) {
                          Comment commentItem = listComment[index];
                          return Container(
                            child: CommentItem(comment: commentItem),
                          );
                        },
                      );
                    } else {
                      return EmptyCommentView(width: widget.width, height: widget.height,);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
