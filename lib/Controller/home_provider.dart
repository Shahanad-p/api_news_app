import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:news_app/News%20View%20Model/news_view_model.dart';
import 'package:news_app/view/Home%20Screen/home_screen.dart';

class HomeProvider extends ChangeNotifier {
  String name = 'bbc-news';
  FilterList? selectedMenu;
  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MMMM dd, yyyy');

  selecMenu(item) {
    selectedMenu = item;
    notifyListeners();
  }
  
}
