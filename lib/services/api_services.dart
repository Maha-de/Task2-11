import 'package:dio/dio.dart';
import '../models/ad_model.dart';

class ApiServices {
  late Dio dio;
  ApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://forkify-api.herokuapp.com/api/",
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );
    dio = Dio(options);
  }
  Future<List<Recipe>> getAllAds() async {
    try {
      Response response = await dio.get("search?q=pizza");
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
