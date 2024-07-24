import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../animation/fadeanimation.dart';
import '../../../../utils/constants.dart';
import '../../../data/models/shoe_model.dart';
import '../../../../view/detail/detail_screen.dart';
import '../../../data/dummy_data.dart';
import '../../../firesbase/storage/product_storage.dart';
import '../../../theme/custom_app_theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;

  final _productStorage = ProductStorage();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            topCategoriesWidget(width, height),
            SizedBox(height: 10),
            middleCategoriesWidget(width, height),
            SizedBox(height: 40),
            moreTextWidget(width),
            lastCategoriesWidget(width, height),
          ],
        ),
      ),
    );
  }

// Top Categories Widget Components
  topCategoriesWidget(width, height) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: width - 20,
          height: height / 14,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontSize: selectedIndexOfCategory == index
                              ? width / 16
                              : width / 18,
                          color: selectedIndexOfCategory == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.unSelectedTextColor,
                          fontWeight: selectedIndexOfCategory == index
                              ? FontWeight.bold
                              : FontWeight.w400),
                    ),
                  ),
                );
              })
        )
      ],
    );
  }

// Middle Categories Widget Components
  middleCategoriesWidget(width, height) {
    return Row(
      children: [
        Container(
          width: width - 20,
          height: height / 2.5,
          child: FutureBuilder(
            future: _productStorage.getProductFromFirestoreFilterByBrand(categories[selectedIndexOfCategory]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error when get product by brand: $snapshot.error');
              } else if (snapshot.hasData) {
                List<ShoeModel> listProduct = snapshot.data!;
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: listProduct.length,
                  itemBuilder: (ctx, index) {
                    ShoeModel model = listProduct[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              model: model,
                              isComeFromMoreSection: false,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        width: width / 1.5,
                        child: Stack(
                          children: [
                            Container(
                              width: width / 1.7,
                              decoration: BoxDecoration(
                                color: model.modelColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              left: width / 40,
                              child: FadeAnimation(
                                delay: 1,
                                child: Row(
                                  children: [
                                    Text(model.brand,
                                        style: AppThemes.homeProductName(width)),
                                    SizedBox(
                                      width: width / 2.9,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: width / 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: width / 10,
                              left: 10,
                              child: FadeAnimation(
                                delay: 1.5,
                                child: Text(model.model,
                                    style: AppThemes.homeProductModel(width)),
                              ),
                            ),
                            Positioned(
                              top: width / 5.5,
                              left: 10,
                              child: FadeAnimation(
                                delay: 2,
                                child: Text("\$${model.price.toStringAsFixed(2)}",
                                    style: AppThemes.homeProductPrice(width)),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: width / 4,
                              child: FadeAnimation(
                                delay: 2,
                                child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(-30 / 360),
                                  child: Container(
                                      width: width / 1.8,
                                      height: height / 6,
                                      child: Image.network(model.imgUrl),
                                    
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: width / 2.1,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_circle_right,
                                  size: width / 18),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text("No Data"),);
              }
            },
          ),
        )
      ],
    );
  }

// More Text Widget Components
  moreTextWidget(width) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("New Product", style: AppThemes.homeMoreText(width)),
          Spacer(),
          Row(
            children: [
              Text(
                "Show all",
                style: AppThemes.hightlightText(width),
              ),
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    CupertinoIcons.arrow_right,
                    size: 14,
                    color: Color(0xfffd6f3e),
                  ))
            ],
          )
        ],
      ),
    );
  }

// Last Categories Widget Components
  lastCategoriesWidget(width, height) {
    return Container(
      width: width,
      height: height / 3.8,
      child: FutureBuilder(
        future: _productStorage.getProductFromFirestoreFilterByBrand(categories[selectedIndexOfCategory]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error when get product by brand: $snapshot.error');
          } else if (snapshot.hasData) {
            List<ShoeModel> listProduct = snapshot.data!;
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: listProduct.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                ShoeModel model = listProduct[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          model: model,
                          isComeFromMoreSection: true,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: width / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: -20,
                          top: 4,
                          child: FadeAnimation(
                            delay: 1,
                            child: RotationTransition(
                                turns: AlwaysStoppedAnimation(-45 / 360),
                                child: Center(
                                    child: FadeAnimation(
                                        delay: 1.5,
                                        child: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 3),
                                          alignment: Alignment.center,
                                          width: width / 6,
                                          color: Colors.red,
                                          child: Text("NEW",
                                              style:
                                                  AppThemes.homeGridNewText(width)),
                                        )))),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          right: -5,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: AppConstantsColor.loveIconColor,
                            ),
                          ),
                        ),
                        Positioned(
                            top: height / 25,
                            left: width / 2.3 / 11,
                            child: Column(
                              children: [
                                FadeAnimation(
                                  delay: 1.5,
                                  child: RotationTransition(
                                    turns: AlwaysStoppedAnimation(-15 / 360),
                                    child: Container(
                                      width: width / 3,
                                      height: height / 9,
                                      child: Hero(
                                        tag: model.model,
                                        child: Image(
                                          image: NetworkImage(model.imgUrl),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Spacer(),
                                FadeAnimation(
                                  delay: 2,
                                  child: FittedBox(
                                    child: Text("${model.brand} ${model.model}",
                                        style:
                                            AppThemes.homeGridNameAndModel(width)),
                                  ),
                                ),
                                FadeAnimation(
                                  delay: 2.2,
                                  child: FittedBox(
                                    child: Text(
                                        "\$${model.price.toStringAsFixed(2)}",
                                        style: AppThemes.homeGridPrice(width)),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              });
          } else {
            return Center(child: Text("No Data"),);
          }
        },
      ),
    );
  }

}
