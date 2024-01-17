import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/ad.model.dart';

class AdsProvider extends ChangeNotifier{
  List<Ad> adList = [];

  Future<void> getAds() async {
    var adsData = await rootBundle.loadString('data/sample.json');
    var dataDecoded =
    List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);
    adList = dataDecoded.map((e) => Ad.fromJson(e)).toList();
    notifyListeners();
  }

}