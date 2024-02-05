import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Service/news_service.dart';
import 'package:news_app/view/home%20screen/home_screen.dart';

class HomeProvider extends ChangeNotifier {
  String name = 'bbc-news';
  FilterList? selectedMenu;
  final Services newsViewModel = Services();
  // NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MMMM dd, yyyy');

  selecMenu(item) {
    selectedMenu = item;
    notifyListeners();
  }
}
