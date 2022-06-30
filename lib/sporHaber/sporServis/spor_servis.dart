import 'dart:convert';

import 'package:haber_uygulamasi/sporHaber/sporModel/spor_articles.dart';
import 'package:haber_uygulamasi/sporHaber/sporModel/spor_model.dart';

import 'package:http/http.dart' as http;

class SporHaberServis {
  static final SporHaberServis _singleton = SporHaberServis._internal();
  SporHaberServis._internal();

  factory SporHaberServis() {
    return _singleton;
  }

  static Future<List<SporArticles>?> getSpor() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=tr&category=sports&apiKey=08f5a300763248f980d47c9e732f4fd0";

    final response = await http.get(Uri.parse(url));
    if (response.body.isNotEmpty) {
      final responseJson = jsonDecode(response.body);
      SporHaberModel haber = SporHaberModel.fromJson(responseJson);
      return haber.articles;
    }
    return null;
  }
}
