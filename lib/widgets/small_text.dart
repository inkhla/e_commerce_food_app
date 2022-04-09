import 'package:e_commerce_food_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double? height;

  SmallText({
    Key? key,
    required this.text,
    this.color = AppColors.textColor,
    this.size =12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'Roboto',
        height: height
      ),

    );
  }
}
