import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_headlines_model.dart';

class NewsRepositary {
  Future<NewsHeadlinesModel> fetchNewsHeadlinesFromApi() async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=e1986a67fad34d8aab402c1607c76323';

    final Response = await http.get(Uri.parse(url));

    if (Response.statusCode == 200) {
      final body = jsonDecode(Response.body);
      return NewsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
