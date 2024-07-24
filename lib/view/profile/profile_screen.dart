import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'widget/appbar.dart';
import 'widget/body.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: const BodyProfile(),
      ),
      
    );
  }
}