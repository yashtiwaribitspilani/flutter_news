import 'dart:convert';

import 'package:flutter_news_app/models/article.dart';
import 'package:http/http.dart' as http;

import 'news_repository.dart';

class NewsApi extends NewsRepository {
  final keyApi = '1f9a7fe92f22428e8585bdc504ffed8a';

  @override
  Future<List<Article>> fetchAllNews() async {
    final url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$keyApi';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final json = body['articles']!;

      return json.map<Article>((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception(
          'Status Code: ${response.statusCode} Body: ${response.body}');
    }
  }

  @override
  Future<List<Article>> fetchCategory(Category category) async {
    final url =
        'https://newsapi.org/v2/top-headlines?country=us&category=${category.name}&apiKey=$keyApi';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('######################################');
      print('######################################');
      print('######################################');
      print('######################################');
      print(body.toString());
      final json = body['articles']!;
      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      print(json);

      return json.map<Article>((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception(
          'Status Code: ${response.statusCode} Body: ${response.body}');
    }
  }
}
