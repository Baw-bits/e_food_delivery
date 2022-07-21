import 'package:flutter/cupertino.dart';
import 'package:fmb/data/repositories/popular_product_repo.dart';
import 'package:fmb/modules/popular_product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print('got product');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products!);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {}
  }
}
