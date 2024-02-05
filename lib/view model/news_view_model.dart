// ignore_for_file: non_constant_identifier_names
import 'package:news_app/model/catgories_new_model.dart';
import 'package:news_app/model/news_headlines_model.dart';
import 'package:news_app/Service/news_service.dart';

class NewsViewModel {
  final repo = Services();

  Future<NewsHeadlinesModel> fetchNewsHeadlinesFromApi(
      String newsChannelName) async {
    final Response = await repo.fetchNewsHeadlinesFromApi(newsChannelName);
    return Response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsFromApi(
      String category) async {
    final Response = await repo.fetchCategoriesNewsFromApi(category);
    return Response;
  }
}
