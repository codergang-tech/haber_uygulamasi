// ignore_for_file: unnecessary_getters_setters

import 'package:haber_uygulamasi/scienceHaber/scienceModel/science_articles.dart';

class ScienceHaberModel {
  String? _status;
  int? _totalResults;
  List<ScienceArticles>? _articles;

  ScienceHaberModel(
      {String? status, int? totalResults, List<ScienceArticles>? articles}) {
    if (status != null) {
      _status = status;
    }
    if (totalResults != null) {
      _totalResults = totalResults;
    }
    if (articles != null) {
      _articles = articles;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  int? get totalResults => _totalResults;
  set totalResults(int? totalResults) => _totalResults = totalResults;
  List<ScienceArticles>? get articles => _articles;
  set articles(List<ScienceArticles>? articles) => _articles = articles;

  ScienceHaberModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = <ScienceArticles>[];
      json['articles'].forEach((v) {
        _articles!.add(ScienceArticles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    data['totalResults'] = _totalResults;
    if (_articles != null) {
      data['articles'] = _articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

