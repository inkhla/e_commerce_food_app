
import 'package:get/get.dart';

import '../../models/popular_products_model.dart';
import '../repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  // the returned data will be saved in this list
  List<dynamic> _recommendedProductList = [];

  // to access the list globally
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool  get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      // initialize the product list to null to avoid data being repeated
      print('recommended');
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      refresh();
    } else {
      print('recommended shit');
      print(response.statusText);
    }
  }
}
