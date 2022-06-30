import 'dart:convert';

import 'package:haber_uygulamasi/teknolojiHaber/teknolojiModel/teknoloji_articles.dart';
import 'package:haber_uygulamasi/teknolojiHaber/teknolojiModel/teknoloji_model.dart';

import 'package:http/http.dart' as http;

class TeknolojiHaberServis {
  static final TeknolojiHaberServis _singleton = TeknolojiHaberServis._internal();
  TeknolojiHaberServis._internal();

  factory TeknolojiHaberServis() {
    return _singleton;
  }

  static Future<List<TeknolojiArticles>?> getTeknoloji() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=tr&category=technology&apiKey=08f5a300763248f980d47c9e732f4fd0";

    final response = await http.get(Uri.parse(url));
    if (response.body.isNotEmpty) {
      final responseJson = jsonDecode(response.body);
      TeknolojiHaberModel haber = TeknolojiHaberModel.fromJson(responseJson);
      return haber.articles;
    }
    return null;
  }
}
