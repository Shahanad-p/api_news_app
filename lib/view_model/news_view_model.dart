import 'package:news_app/model/catgories_new_model.dart';
import 'package:news_app/model/news_headlines_model.dart';
import 'package:news_app/repositary/news_repositary.dart';

class NewsViewModel {
  final _repo = NewsRepositary();

  Future<NewsHeadlinesModel> fetchNewsHeadlinesFromApi(
      String channelName) async {
    final Response = await _repo.fetchNewsHeadlinesFromApi(channelName);
    return Response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsFromApi(
      String category) async {
    final Response = await _repo.fetchCategoriesNewsFromApi(category);
    return Response;
  }
}
