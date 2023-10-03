import 'package:dio/dio.dart';

import '../modals/product_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();
  final String api = "https://dummyjson.com/product?limit=100";

  Future<List<ProductModal>?> getProduct() async {
    Response response = await dio.get(api);
    if (response.statusCode == 200) {
      List allData = response.data['products'];
      List<ProductModal> allProducts =
          allData.map((e) => ProductModal.fromMap(data: e)).toList();
      return allProducts;
    } else {
      return null;
    }
  }
}
