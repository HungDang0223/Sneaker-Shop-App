import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop_app/controller/sign_in_controller.dart';
import 'package:sneaker_shop_app/data/models/comment.dart';
import 'package:sneaker_shop_app/view/detail/components/comment_view.dart';
import 'package:sneaker_shop_app/view/detail/components/empty_comment_view.dart';
import 'package:sneaker_shop_app/view/detail/widget/comment.dart';

import '../../../../../animation/fadeanimation.dart';
import '../../../../../utils/constants.dart';
import '../../../data/models/shoe_model.dart';
import '../../../data/dummy_data.dart';
import '../../../data/models/models.dart';
import '../../../firesbase/storage/cart.dart';
import '../../../theme/custom_app_theme.dart';

class DetailsBody extends StatefulWidget {

  ShoeModel model;
  bool isComeFromMoreSection;
  DetailsBody({required this.model, required this.isComeFromMoreSection});

  @override
  details createState() => details();
}

class details extends State<DetailsBody> {

  final _cart = Cart();
  final _userController = Get.put(UserController());

  int? _isSelectedSize;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            // height: height - height / 7,
              child: Column(
                children: [
                  topInformationWidget(width, height),
                  middleImgListWidget(width, height),
                  SizedBox(
                    height: 20,
                    width: width / 1.1,
                    child: Divider(
                      thickness: 1.4,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        nameAndPrice(width),
                        SizedBox(height: 10),
                        shoeInfo(width, height),
                        SizedBox(
                          height: 5,
                        ),
                        moreDetailsText(width, height),
                        SizedBox(
                          height: 10,
                        ),
                        endSizesAndButton(width, height),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  // EmptyCommentView(width: width,height: height,)
                  CommentView(width: width,height: height, model: widget.model),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: materialButton(width, height))
        ]
      ),
    );
  }

  // Top information Widget Components
  topInformationWidget(width, height) {
    return Container(
      width: width,
      height: height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            bottom: 20,
            child: FadeAnimation(
              delay: 0.5,
              child: Container(
                width: 1000,
                height: height / 2.2,
                decoration: BoxDecoration(
                  color: widget.model.modelColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1500),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-25 / 360),
                child: Container(
                  width: width / 1.3,
                  height: height / 4.3,
                  child: Image.network(widget.model.imgUrl),
                ),
            ),
          )
        ],
      ),
    );
  }

  // Rounded Image Widget About Below method Components
  roundedImage(width, height) {
    return Container(
      padding: EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: NetworkImage(widget.model.imgUrl),
      ),
    );
  }

  // Middle Image List Widget Components
  middleImgListWidget(width, height) {
    return FadeAnimation(
      delay: 0.5,
      child: Container(
        padding: EdgeInsets.all(2),
        width: width,
        height: height / 11,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            roundedImage(width, height),
            roundedImage(width, height),
            roundedImage(width, height),
            Container(
              padding: EdgeInsets.all(2),
              width: width / 5,
              height: height / 14,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: NetworkImage(widget.model.imgUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(1), BlendMode.darken),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: AppConstantsColor.lightTextColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //MaterialButton Components
  materialButton(width, height) {
    return FadeAnimation(
      delay: 3.5,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: width,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {
          _cart.addToCart(widget.model, 30, quantity);
        },
        child: Text(
          "Thêm vào giỏ hàng",
          style: TextStyle(
              fontSize: width/22,
              color: AppConstantsColor.whiteTextColor,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  //end section Sizes And Button Components
  endSizesAndButton(width, height) {
    return Container(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        delay: 3,
        child: Row(
          children: [
            Container(
              width: width - 16,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: sizes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSelectedSize = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        width: width / 5,
                        height: height / 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: _isSelectedSize == index
                                  ? Colors.black
                                  : Colors.grey,
                              width: 1.5),
                          color: _isSelectedSize == index
                              ? Colors.black
                              : AppConstantsColor.backgroundColor,
                        ),
                        child: Center(
                          child: Text(
                            sizes[index].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _isSelectedSize == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
  //more details Text Components
  moreDetailsText(width, height) {
    return FadeAnimation(
      delay: 2,
      child: Container(
        padding: EdgeInsets.only(right: 280),
        height: height / 26,
        child: FittedBox(
            child: Text('Chi tiết sản phẩm', style: AppThemes.detailsMoreText(width)),
      ),)
    );
  }

  //About Shoe Text Components
  shoeInfo(width, height) {
    return FadeAnimation(
      delay: 1.5,
      child: Container(
        width: width,
        height: height / 8,
        child: Text(
            "Mô tả",
            style: AppThemes.detailsProductDescriptions),
      ),
    );
  }

  //Name And Price Text Components
  nameAndPrice(width) {
    return FadeAnimation(
      delay: 1,
      child: Row(
        children: [
          Text(
            widget.model.model,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppConstantsColor.darkTextColor,
            ),
          ),
          Expanded(child: Container()),
          Text('\$${widget.model.price.toStringAsFixed(2)}',
              style: AppThemes.detailsProductPrice(width)),
        ],
      ),
    );
  }
}
