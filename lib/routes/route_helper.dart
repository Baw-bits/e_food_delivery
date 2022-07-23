import 'package:fmb/pages/food/popular_food_detail.dart';
import 'package:fmb/pages/food/recommended_food_detail.dart';
import 'package:fmb/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => '$initial';
  static String getRecommended() => '$recommendedFood';
  static String getPopularFood() => '$popularFood';

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => MainFoodPage()),
    GetPage(name: '/popular-food', page: () => PopularFoodDetail()),
    GetPage(name: '/recommended-food', page: () => RecommendedFoodDetail()),
  ];
}
