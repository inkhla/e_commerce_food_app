import 'package:e_commerce_food_app/data/repository/cart_repo.dart';
import 'package:e_commerce_food_app/models/popular_products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';
import '../../utils/colors.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  final Map<int ,CartModel> _items = {};

  Map<int,CartModel> get items => _items;

  void addItem(ProductModel product, int quantity){
    // print('length of the item list is ' + _items.length.toString());
    var totalQuantity = 0;
    if(_items.containsKey(product.id)){
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          img: value.img,
          name: value.name,
          price: value.price,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });

      if(totalQuantity <= 0 ){
        _items.remove(product.id);
      }
    }else{
     if(quantity > 0){
       _items.putIfAbsent(product.id!, () {
         return CartModel(
           id: product.id,
           img: product.img,
           name: product.name,
           price: product.price,
           quantity: quantity,
           isExist: true,
           time: DateTime.now().toString(),
         );
       });
       refresh();
     }else{
       Get.snackbar('Item Count', 'You should at least add an item in the cart !',
         backgroundColor: AppColors.mainColor,
         colorText: Colors.white,
       );
     }
    }
    }

    bool existInCart(ProductModel product ,){
    if(_items.containsKey(product.id)){
      return true;
    }else{
      return false;
    }
    }

    int getQuantity(ProductModel product){
    int quantity  = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
    }

    int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
    }

}