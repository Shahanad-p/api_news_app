// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/constant/constant_key.dart';
import 'package:news_app/model/catgories_new_model.dart';
import 'package:news_app/model/news_headlines_model.dart';

class Services {
  Future<NewsHeadlinesModel> fetchNewsHeadlinesFromApi(
      String channelName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=${ConstantKey.headlineKey}';

    final Response = await http.get(Uri.parse(url));

    if (Response.statusCode == 200) {
      final body = jsonDecode(Response.body);
      return NewsHeadlinesModel.fromJson(body);
    }
    const userMessage =
        'Sorry, we encountered an error while fetching news. Please try again later!';
    throw Exception(userMessage);
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsFromApi(
      String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=$category&apiKey=${ConstantKey.categoryKey}';

    final Response = await http.get(Uri.parse(url));

    if (Response.statusCode == 200) {
      final body = jsonDecode(Response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    const userMessage =
        'Sorry, we encountered an error while fetching news. Please try again later!';
    throw Exception(userMessage);
  }
}
