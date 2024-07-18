import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop_app/firesbase/storage/product_storage.dart';

import '../../../../utils/app_methods.dart';
import '../../../animation/fadeanimation.dart';
import '../../../data/models/models.dart';
import '../../../firesbase/authentification/auth_service.dart';
import '../../../firesbase/storage/cart.dart';
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
  final _cart = Cart();

  int quantity = 1;
  bool delete = false;
  int lengthsOfItemsOnBag = itemsOnBag.length;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: width,
      height: height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Divider(
              color: Colors.grey,
            ),
            Column(children: [
                  mainListView(width, height),
                  const SizedBox(
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
        child: const Text(
          "NEXT",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }

  // Main ListView Components
  mainListView(width, height) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: height,
      child: FutureBuilder(
            future: _cart.getProductByUID(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    height: 30,
                    width: 30,
                    child: const CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error when get product by brand: $snapshot.error');
              } else if (snapshot.hasData) {
                List<Map<String, dynamic>> listCartItem = snapshot.data!;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: listCartItem.length,
                  itemBuilder: (ctx, index) {
                    Map<String, dynamic> currentItem = listCartItem[index];
                    print(currentItem);
                    ShoeModel shoe = currentItem["product"];
                    print(shoe);
                    return FadeAnimation(
                      delay: index / 4,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
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
                                      turns: const AlwaysStoppedAnimation(-40 / 360),
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        child: Image(
                                          image: NetworkImage(
                                            shoe.imgUrl,
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
                                  Text(shoe.model,
                                      style: AppThemes.bagProductModel(width)),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text("\$${shoe.price}",
                                      style: AppThemes.bagProductPrice(width)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (quantity>1) {
                                              quantity -= 1;
                                            } else {
                                              Get.defaultDialog(
                                                onConfirm: () => itemsOnBag.remove(currentItem),
                                                onCancel: () {},
                                                middleText: "Bạn chắc chắn muốn xóa sản phẩm này?"
                                              );
                                            }
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
                                            size: width / 20,
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(currentItem["quantity"].toString(), style: AppThemes.bagProductNumOfShoe(width)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity += 1;
                                          });
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey[300],
                                          ),
                                          child: const Center(
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
                  });
              } else {
                return const Center(child: Text("No Data"),);
              }
            },
          ),
        
    );
  }

  bottomInfo(width, height) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
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
          const SizedBox(
            height: 20,
          ),
          materialButton(width, height)
        ],
      ),
    );
  }
}
