import 'package:e_commerce_food_app/utils/dimensions.dart';
import 'package:e_commerce_food_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  double? size;

  IconTextWidget(
      {Key? key,
      required this.text,
      required this.iconColor,
      this.size,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = Dimensions.defaultIconSize;
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: size ?? defaultSize,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
