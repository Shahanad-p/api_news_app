import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/News%20View%20Model/news_view_model.dart';

class CategoryProvider extends ChangeNotifier {
  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MMMM dd, yyyy');
  String categoryName = 'general';
  List<String> categoriesList = [
    'General',
    'Entertainment',
    'Health',
    'Sports',
    'Buisiness',
    'Technology'
  ];

  categoryList(index) {
    categoryName = categoriesList[index];
    notifyListeners();
  }
}
