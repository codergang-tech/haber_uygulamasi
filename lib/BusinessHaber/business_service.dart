import 'dart:convert';

import 'package:haber_uygulamasi/BusinessHaber/businessModel/business_article.dart';
import 'package:haber_uygulamasi/BusinessHaber/businessModel/business_haber.dart';

import 'package:http/http.dart' as http;

class BusinessHaberServis {
  static final BusinessHaberServis _singleton = BusinessHaberServis._internal();
  BusinessHaberServis._internal();

  factory BusinessHaberServis() {
    return _singleton;
  }

  static Future<List<BusinessArticles>?> getBusiness() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=08f5a300763248f980d47c9e732f4fd0";

    final response = await http.get(Uri.parse(url));
    if (response.body.isNotEmpty) {
      final responseJson = jsonDecode(response.body);
      BusinessHaberModel haber = BusinessHaberModel.fromJson(responseJson);
      return haber.articles;
    }
    return null;
  }
}
