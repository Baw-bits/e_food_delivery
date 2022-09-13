import 'package:fmb/pages/cart/cart_page.dart';
import 'package:fmb/pages/food/popular_food_detail.dart';
import 'package:fmb/pages/food/recommended_food_detail.dart';
import 'package:fmb/pages/home/home_page.dart';
import 'package:fmb/pages/home/main_food_page.dart';
import 'package:fmb/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cart = '/cart';

  static String getSplashPage()=>'$splashPage';
  static String getInitial() => '$initial';

  static String getRecommended(int padeId, String page) => '$recommendedFood?pageId=$padeId&page=$page';

  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';

  static String getCart() => '$cart';
  static List<GetPage> routes = [
    GetPage(name: splashPage, page: ()=>SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!),page:page!);
        }),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page:page!);
        }),
    GetPage(
      transition: Transition.fadeIn,
        name: cart,
        page: () {
          return CartPage();
        })
  ];
}
