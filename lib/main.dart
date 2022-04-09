
import 'package:e_commerce_food_app/data/controllers/popular_product_controller.dart';
import 'package:e_commerce_food_app/data/controllers/recommended_food_controller.dart';
import 'package:e_commerce_food_app/routes/route_helper.dart';
import 'package:e_commerce_food_app/screens/home/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return  GetMaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      home: const MainFoodPage(),
      initialRoute:  RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

