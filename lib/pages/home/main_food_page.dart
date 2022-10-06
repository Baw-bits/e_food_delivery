import 'package:flutter/material.dart';
import 'package:fmb/pages/home/food_page_body.dart';
import 'package:fmb/utils/colors.dart';
import 'package:fmb/utils/dimensions.dart';
import 'package:fmb/widgets/big_text.dart';
import 'package:fmb/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
          children: [
            //Showing the header
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  right: Dimensions.width20, left: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Nigeria',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Abuja',
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.icon24,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                  )
                ],
              ),
            ),
            //showing the body
            Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            )
          ],
        ),
        onRefresh: _loadResources);
  }
}
