import 'package:e_commerce_food_app/widgets/big_text.dart';
import 'package:e_commerce_food_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'icon_text_widget.dart';

class MealDesc extends StatelessWidget {
  final String text;
  const MealDesc({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // dish name
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        // rating and comments
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: Dimensions.height15,
                );
              }),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(
              text: '4.5',
              size: Dimensions.font12,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(
              text: '1278',
              size: Dimensions.font12,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(
              text: 'comments',
              size: Dimensions.font12,
            )
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        // goodness , distance and time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextWidget(
              text: 'Normal',
              iconColor: AppColors.iconColor1,
              icon: Icons.circle_sharp,
            ),
            IconTextWidget(
              text: '1.7km',
              iconColor: AppColors.mainColor,
              icon: Icons.location_on,
            ),
            IconTextWidget(
              text: '32min',
              iconColor: AppColors.iconColor2,
              icon: Icons.access_time_rounded,
            ),
          ],
        ),
      ],
    );
  }
}
