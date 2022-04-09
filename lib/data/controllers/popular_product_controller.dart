import 'package:e_commerce_food_app/data/controllers/cart_controller.dart';
import 'package:e_commerce_food_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_food_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/popular_products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  // the returned data will be saved in this list
  List<dynamic> _popularProductList = [];

  // to access the list globally
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool  get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // initialize the product list to null to avoid data being repeated
      print('shit');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      refresh();
    } else {
      print('very shit');
      print(response.statusText);
    }
  }
  void setQuantity(bool isIncrement){
    if(isIncrement){
      print('increment');
      _quantity ++ ;
    }else{
       if(_quantity + _inCartItems > 0){
         _quantity --;
       }else{
         Get.snackbar('Item Count', 'You can not reduce more !',
         backgroundColor: AppColors.mainColor,
         colorText: Colors.white,
         );
       }
      }
    refresh();
    }

    void initProduct(CartController cart,ProductModel product){
    _quantity = 0;
    _inCartItems =0 ;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // get from storage _inCartItems
      print('exist or not ' + exist.toString());
      if(exist){
        _inCartItems = _cart.getQuantity(product);
      }
      print('the quantity in the cart is '+ _inCartItems.toString());
    }

    void addItem(ProductModel product){
    if(_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        print('the id is '+value.id.toString() + ' the quantity is '+ value.quantity.toString());
      });
    }else{
      Get.snackbar('Item Count', 'You should at least add an item in the cart !',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
    update();
    }

    int get totalItems{
    return _cart.totalItems;
    }
  }

