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
        'category': categoryId,
        //'language': 'ar',
      });
      print('Requesting sources from: $url');
      var response = await http.get(url);
      print('Sources response: ${response.body}');
      return Source.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      //print(object)
    } on Exception catch (e) {
      print('Error fetching sources: $e');
      throw e;
    }
  }

  static Future<News?> getNewsBySourceId(String? sourceId,
      {int pageSize = 10, int page = 1, String? q}) async {
    try {
      Uri url = Uri.https(ApiConstans.authority, ApiConstans.newsApi, {
        'apiKey': ApiConstans.apiKey,
        'sources': sourceId,
        'pageSize': pageSize.toString(),
        'page': page.toString(),
        'q': q,
        //'language': 'ar',
      });
      print('Requesting news from: $url');
      var response = await http.get(url);
      print('News response: ${response.body}');
      return News.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } on Exception catch (e) {
      print('Error fetching news: $e');
      throw e;
    }
  }
}
