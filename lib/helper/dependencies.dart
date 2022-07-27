import 'package:fmb/controllers/cart_controller.dart';
import 'package:fmb/controllers/popular_product_controller.dart';
import 'package:fmb/controllers/recommended_product_controller.dart';
import 'package:fmb/data/repositories/cart_repo.dart';
import 'package:fmb/data/repositories/popular_product_repo.dart';
import 'package:fmb/data/repositories/recommended_product_repo.dart';
import 'package:fmb/utils/app_constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:fmb/data/api/api_client.dart';

Future<void> init() async {
  //apiclient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //popular product repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //recommended repo
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  //Cart controller
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  //recommended controller
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  //popular product controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
