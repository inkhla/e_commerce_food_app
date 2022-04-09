import 'package:e_commerce_food_app/utils/colors.dart';
import 'package:e_commerce_food_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
   Color? color;
  double? size;
  TextOverflow overFlow;

   BigText({
    Key? key,
    required this.text,
    this.color = AppColors.mainBlackColor,
    this.overFlow = TextOverflow.ellipsis,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? Dimensions.font20,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
      overflow: overFlow,
    );
  }
}
