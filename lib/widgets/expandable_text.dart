import 'package:e_commerce_food_app/utils/colors.dart';
import 'package:e_commerce_food_app/utils/dimensions.dart';
import 'package:e_commerce_food_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.size120;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt(), widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
        size: Dimensions.font16,
        color: AppColors.paraColor,
            )
          : Column(
              children: [
                SmallText(
                  text:
                      hiddenText ? (firstHalf + '...') : firstHalf + secondHalf,
                  size: Dimensions.font16,
                  color: AppColors.paraColor,
                  height: 1.7,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      hiddenText =! hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(text: hiddenText ?'Show more' : 'Show less',color: AppColors.mainColor,),
                       Icon(hiddenText ?Icons.arrow_drop_down : Icons.arrow_drop_up,color: AppColors.mainColor,)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
