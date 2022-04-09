import 'package:e_commerce_food_app/data/api/api_client.dart';
import 'package:e_commerce_food_app/utils/app_constants.dart';
import 'package:get/get.dart';

// when you load data from the internet using Getx
// you should extend GetxService
class PopularProductRepo extends GetxService{
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData( AppConstants.POPULAR_PRODUCT_URI);
  }
}