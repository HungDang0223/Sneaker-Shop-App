import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom_app_theme.dart';

class EmptyCommentView extends StatelessWidget {

  final width, height;
  const EmptyCommentView({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Oops!!!", style: AppThemes.superBoldText(width),),
                  Text("Chưa có bình luận nào ở đây cả."
                      "\nHãy trở thành người bình luận đầu tiên"),
                  Image.asset(
                    "assets/images/comment.png",
                    width: 60,
                    height: 60,
                    color: Colors.grey,),
                ],
              )
            ],
          ),
        ),
    );
  }
}
