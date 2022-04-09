import 'package:get/get.dart';
class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.35;
  static double pageViewTextContainer = screenHeight / 6.15;
  static double pageView = screenHeight / 2.3;
  // dynamic height for padding and margin
  static double height10 = screenHeight / 73.8;
  static double height20 = screenHeight / 37.9;
  static double height15 = screenHeight / 49.2;
  static double height30 = screenHeight / 24.6;
  static double height45 = screenHeight / 16.4;

  // dynamic height for padding and margin
  static double width10 = screenHeight / 73.8;
  static double width15 = screenHeight / 49.2;
  static double width20 = screenHeight / 37.9;
  static double width30 = screenHeight / 24.6;
  static double width45 = screenHeight / 16.4;

  static double font20 = screenHeight / 37.9;
  static double font26 = screenHeight / 28.4;
  static double font12 = screenHeight / 61.5;
  static double font16 = screenHeight / 46.125;

  static double defaultIconSize = screenHeight / 30.75;
  static double iconSize16 = screenHeight / 46.125;
  static double iconSize24 = screenHeight / 30.75;

  // dynamic radius
  static double radius15 = screenHeight / 49.2;
  static double radius20 = screenHeight / 37.9;
  static double radius30 = screenHeight / 24.6;


  // dynamic Sizes
  static double size120 = screenHeight / 6.15;
  static double size70 = screenHeight / 10.6;
  static double size100 = screenHeight / 7.38;
  static double size350 = screenHeight/ 2.1;


}