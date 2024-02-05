import 'package:flutter/foundation.dart';
import 'package:news_app/Service/news_service.dart';
import 'package:news_app/model/catgories_new_model.dart';
import 'package:news_app/model/news_headlines_model.dart';

class NewsProvider extends ChangeNotifier {
  final Services _services = Services();

  Future<NewsHeadlinesModel> fetchNewsHeadlinesFromApi(
      String channelName) async {
    try {
      return await _services.fetchNewsHeadlinesFromApi(channelName);
    } catch (e) {
      throw Exception('Error fetching news channel headlines');
    }
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsFromApi(
      String category) async {
    try {
      return await _services.fetchCategoriesNewsFromApi(category);
    } catch (e) {
      throw Exception('Error fetching category news');
    }
  }
}
