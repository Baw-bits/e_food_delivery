import 'package:fmb/pages/food/popular_food_detail.dart';
import 'package:fmb/pages/food/recommended_food_detail.dart';
import 'package:fmb/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => '$initial';
  static String getRecommended(int padeId) => '$recommendedFood?pageId=$padeId';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => MainFoodPage()),
    GetPage(
        name: '/popular-food',
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: '/recommended-food',
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!));
        }),
  ];
}
