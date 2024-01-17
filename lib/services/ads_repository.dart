import '../models/ad.model.dart';
import '../models/ad_model.dart';
import 'api_services.dart';

class AdsRepository{
  ApiServices apiServices;

  AdsRepository(this.apiServices);

  Future<List<Recipe>> getAllAds() async {
    final ads = await apiServices.getAllAds();
    return ads.map((e) => Recipe.fromJson(e as Map<String, dynamic>)).toList();
  }
}