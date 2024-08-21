//6ce2028917c44f3b97cb1e915456a0d4
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=6ce2028917c44f3b97cb1e915456a0d4
*/

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/model/source.dart';

class ApiManager {
  static Future<Source?> getSourcesByCategory(String categoryId) async {
    try {
      Uri url = Uri.https(ApiConstans.authority, ApiConstans.sourcesApi, {
        'apiKey': ApiConstans.apiKey,
        'category':categoryId
      });
      var response = await http.get(url);
      return Source.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } on Exception catch (e) {
      throw e;
    }
  }

  static Future<News?> getNewsBySourceId(String? sourceId) async {
    try {
      Uri url = Uri.https(ApiConstans.authority, ApiConstans.newsApi, {
        'apiKey': ApiConstans.apiKey,
        'sources': sourceId,
      });
      var response = await http.get(url);
      return News.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } on Exception catch (e) {
      throw e;
    }
  }
}
