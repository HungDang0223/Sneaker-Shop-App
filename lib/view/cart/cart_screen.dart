import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'widget/app_bar.dart';
import 'widget/body.dart';

class MyCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customBagAppBar(context),
        body: BodyBagView(),
      ),
    );
  }
}
