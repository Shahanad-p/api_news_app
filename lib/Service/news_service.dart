// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/catgories_new_model.dart';
import 'package:news_app/model/news_headlines_model.dart';

class NewsRepositary {
  Future<NewsHeadlinesModel> fetchNewsHeadlinesFromApi(
      String channelName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=e1986a67fad34d8aab402c1607c76323';

    final Response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(Response.body);
    }
    if (Response.statusCode == 200) {
      final body = jsonDecode(Response.body);
      return NewsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsFromApi(
      String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=$category&apiKey=e1986a67fad34d8aab402c1607c76323';

    final Response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(Response.body);
    }
    if (Response.statusCode == 200) {
      final body = jsonDecode(Response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}