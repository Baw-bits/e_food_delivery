import 'package:fmb/data/repositories/cart_repo.dart';
import 'package:fmb/modules/popular_product_model.dart';
import 'package:get/get.dart';

import '../modules/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    print('Items length ' + _items.length.toString());
    _items.putIfAbsent(product.id!, () {
      print('adding to cart ' +
          product.id.toString() +
          "quantity: " +
          quantity.toString());
      return CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        time: DateTime.now().toString(),
        isExist: true,
      );
    });
  }
}
