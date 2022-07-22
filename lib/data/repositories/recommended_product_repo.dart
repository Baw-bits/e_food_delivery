import 'package:fmb/data/api/api_client.dart';
import 'package:fmb/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
