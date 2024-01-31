import 'package:news_app/model/news_headlines_model.dart';
import 'package:news_app/repositary/news_repositary.dart';

class NewsViewModel {
  final _repo = NewsRepositary();

  Future<NewsHeadlinesModel> fetchNewsHeadlinesFromApi(
      String channelName) async {
    final Response = await _repo.fetchNewsHeadlinesFromApi(channelName);
    return Response;
  }
}
