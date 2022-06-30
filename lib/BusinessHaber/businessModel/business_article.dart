// ignore_for_file: unnecessary_getters_setters

import 'package:haber_uygulamasi/BusinessHaber/businessModel/business_source.dart';

class BusinessArticles {
  BusinessSource? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  BusinessArticles(
      {BusinessSource? source,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content}) {
    if (source != null) {
      _source = source;
    }
    if (author != null) {
      _author = author;
    }
    if (title != null) {
      _title = title;
    }
    if (description != null) {
      _description = description;
    }
    if (url != null) {
      _url = url;
    }
    if (urlToImage != null) {
      _urlToImage = urlToImage;
    }
    if (publishedAt != null) {
      _publishedAt = publishedAt;
    }
    if (content != null) {
      _content = content;
    }
  }

  BusinessSource? get source => _source;
  set source(BusinessSource? source) => _source = source;
  String? get author => _author;
  set author(String? author) => _author = author;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get urlToImage => _urlToImage;
  set urlToImage(String? urlToImage) => _urlToImage = urlToImage;
  String? get publishedAt => _publishedAt;
  set publishedAt(String? publishedAt) => _publishedAt = publishedAt;
  String? get content => _content;
  set content(String? content) => _content = content;

  BusinessArticles.fromJson(Map<String, dynamic> json) {
    _source =
        json['source'] != null ? BusinessSource.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_source != null) {
      data['source'] = _source!.toJson();
    }
    data['author'] = _author;
    data['title'] = _title;
    data['description'] = _description;
    data['url'] = _url;
    data['urlToImage'] = _urlToImage;
    data['publishedAt'] = _publishedAt;
    data['content'] = _content;
    return data;
  }
}