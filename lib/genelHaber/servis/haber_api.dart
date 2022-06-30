import 'dart:convert';

import 'package:haber_uygulamasi/genelHaber/model/artikel_model.dart';
import 'package:haber_uygulamasi/genelHaber/model/haber_model.dart';

import 'package:http/http.dart' as http;

class GenelHaberServis {
  static final GenelHaberServis _singleton = GenelHaberServis._internal();
  GenelHaberServis._internal();

  factory GenelHaberServis() {
    return _singleton;
  }

  static Future<List<GenelArticles>?> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=tr&category=&apiKey=08f5a300763248f980d47c9e732f4fd0";

    final response = await http.get(Uri.parse(url));
    if (response.body.isNotEmpty) {
      final responseJson = jsonDecode(response.body);
      GenelHaberModel haber = GenelHaberModel.fromJson(responseJson);
      return haber.articles;
    }
    return null;
  }
}
