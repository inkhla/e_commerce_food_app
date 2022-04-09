import 'package:e_commerce_food_app/data/api/api_client.dart';
import 'package:e_commerce_food_app/utils/app_constants.dart';
import 'package:get/get.dart';

// when you load data from the internet using Getx
// you should extend GetxService
class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData( AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}