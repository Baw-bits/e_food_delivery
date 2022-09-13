import 'dart:convert';

import 'package:fmb/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    /*
    convert object to string because sharedpreference only accepts strings.
    */
    cartList.forEach((element)=>cart.add(jsonEncode(element)));
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
  getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts=[];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts=sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print('inside getCartLiost '+carts.toString());
    }
    List<CartModel> cartList = [];
    carts.forEach((element)=>CartModel.fromJson(jsonDecode(element)));

    return cartList;
  }
}
