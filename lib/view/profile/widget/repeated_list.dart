import 'package:flutter/material.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';

class SettingItem extends StatelessWidget {
  double width;
  double height;
  Color? leadingBackColor;
  IconData icon;
  String title;
  Widget trailling;

  SettingItem({
    required this.width,
    required this.height,
    required this.leadingBackColor,
    required this.icon,
    required this.title,
    required this.trailling,
  });

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Container(
          width: width,
          height: height / 21,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: leadingBackColor,
                radius: 16,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    color: AppConstantsColor.lightTextColor,
                    size: width/23,
                  ),
                ),
              ),
              SizedBox(width: width/25,),
              Text(title, style: AppThemes.profileRepeatedListTileTitle(width)),
              Spacer(),
              trailling
            ],
          ),
        ),
      ),
    );
  }
}
