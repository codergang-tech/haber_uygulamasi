import 'dart:convert';

import 'package:haber_uygulamasi/scienceHaber/scienceModel/science_articles.dart';
import 'package:haber_uygulamasi/scienceHaber/scienceModel/science_model.dart';

import 'package:http/http.dart' as http;

class ScienceHaberServis {
  static final ScienceHaberServis _singleton = ScienceHaberServis._internal();
  ScienceHaberServis._internal();

  factory ScienceHaberServis() {
    return _singleton;
  }

  static Future<List<ScienceArticles>?> getNScience() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=tr&category=science&apiKey=08f5a300763248f980d47c9e732f4fd0";

    final response = await http.get(Uri.parse(url));
    if (response.body.isNotEmpty) {
      final responseJson = jsonDecode(response.body);
      ScienceHaberModel haber = ScienceHaberModel.fromJson(responseJson);
      return haber.articles;
    }
    return null;
  }
}
