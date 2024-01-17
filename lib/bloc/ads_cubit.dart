import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../models/ad.model.dart';
import '../models/ad_model.dart';
import '../services/ads_repository.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {


  AdsCubit() : super(AdsInitial(ads: []));

  Future<void> getAds() async {
    emit(AdsLoading());
    await Future.delayed(Duration(seconds: 2));
    var adsData = await rootBundle.loadString('data/sample.json');
    var dataDecoded =
    List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);
    emit(AdsInitial(ads: dataDecoded.map((e) => Ad.fromJson(e)).toList()));

  }


}