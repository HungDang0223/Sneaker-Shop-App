import 'package:flutter/material.dart';

import '../../../../utils/app_methods.dart';
import '../../../animation/fadeanimation.dart';
import '../../../data/models/models.dart';
import '../../../firesbase/authentification/auth_service.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';
import '../../../view/bag/widget/empty_list.dart';
import '../../../data/dummy_data.dart';

class BodyBagView extends StatefulWidget {
  const BodyBagView({Key? key}) : super(key: key);

  @override
  _BodyBagViewState createState() => _BodyBagViewState();
}

class _BodyBagViewState extends State<BodyBagView>
    with SingleTickerProviderStateMixin {

  final _auth = AuthService();
  int lengthsOfItemsOnBag = itemsOnBag.length;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: width,
      height: height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Divider(
              color: Colors.grey,
            ),
            itemsOnBag.isEmpty
              ? EmptyList()
              : Column(children: [
                  mainListView(width, height),
                  SizedBox(
                    height: 12,
                  ),
                  bottomInfo(width, height),
                ])
          ],
        ),
      ),
    );
  }

  // Material Button Components
  materialButton(width, height) {
    return FadeAnimation(
      delay: 3,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: width / 1.2,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {},
        child: Text(
          "NEXT",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }

  // Main ListView Components
  mainListView(width, height) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      // width: width,
      height: height,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: itemsOnBag.length,
          itemBuilder: (ctx, index) {
            ShoeModel currentBagItem = itemsOnBag[index];

            return FadeAnimation(
              delay: index / 4,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: width,
                height: height / 6,
                child: Row(
                  children: [
                    Container(
                      width: width / 2.8,
                      child: Stack(children: [
                        Positioned(
                          top: 0,
                          left: 10,
                          child: Container(
                            width: width / 3.2,
                            height: height / 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey[350],
                            ),
                          ),
                        ),
                        Positioned(
                            right: 10,
                            bottom: 0,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-40 / 360),
                              child: Container(
                                width: 120,
                                height: 120,
                                child: Image(
                                  image: AssetImage(
                                    currentBagItem.imgAddress,
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentBagItem.model,
                              style: AppThemes.bagProductModel(width)),
                          SizedBox(
                            height: 4,
                          ),
                          Text("\$${currentBagItem.price}",
                              style: AppThemes.bagProductPrice(width)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    itemsOnBag.remove(currentBagItem);
                                    lengthsOfItemsOnBag = itemsOnBag.length;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 15,
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("1", style: AppThemes.bagProductNumOfShoe(width)),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 15,
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  bottomInfo(width, height) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          FadeAnimation(
            delay: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TOTAL", style: AppThemes.bagTotalPrice(width)),
                Text("\$${AppMethods.sumOfItemsOnBag()}",
                    style: AppThemes.bagSumOfItemOnBag(width)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          materialButton(width, height)
        ],
      ),
    );
  }
}
