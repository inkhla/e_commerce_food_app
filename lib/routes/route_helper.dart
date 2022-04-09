import 'package:e_commerce_food_app/screens/food/popular_food_detail.dart';
import 'package:e_commerce_food_app/screens/food/recommended_food_detail.dart';
import 'package:e_commerce_food_app/screens/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() {
    return initial;
  }
  static String getPopularFood(int pageId)
    =>  '$popularFood?pageId= $pageId';

  static String getRecommended(int pageId) {
    return '$recommendedFood?pageId=$pageId';
  }

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        print('popular food get called');
        return PopularFoodDetail(pageId: int.parse(pageId!),);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        print('recommended food get called');
        return RecommendedFoodDetail(pageId: int.parse(pageId!),);
      },
      transition: Transition.fadeIn,
    )
  ];
}
