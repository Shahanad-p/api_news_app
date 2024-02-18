import 'package:flutter/material.dart';
import 'package:news_app/Controller/home_provider.dart';
import 'package:news_app/view/category_screen/category_screen.dart';
import 'package:news_app/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title:  Text(
      'News',
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(),
          ),
        );
      },
      icon:  Icon(Icons.apps),
      color: Colors.black,
    ),
    actions: [
      Consumer<HomeProvider>(
        builder: (context, value, child) => PopupMenuButton<FilterList>(
          initialValue: value.selectedMenu,
          icon:  Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onSelected: (FilterList item) {
            if (FilterList.bbcNews.name == item.name) {
              value.name = 'bbc-news';
            }
            if (FilterList.aryNews.name == item.name) {
              value.name = 'ary-news';
            }
            if (FilterList.bleacherReport.name == item.name) {
              value.name = 'bleacher-report';
            }
            if (FilterList.reuters.name == item.name) {
              value.name = 'reuters';
            }
            if (FilterList.cnn.name == item.name) {
              value.name = 'cnn';
            }
            if (FilterList.alJazeera.name == item.name) {
              value.name = 'al-jazeera-english';
            }
            value.selecMenu(item);
          },
          itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
             PopupMenuItem<FilterList>(
              value: FilterList.bbcNews,
              child: Text('BBC News'),
            ),
             PopupMenuItem<FilterList>(
              value: FilterList.aryNews,
              child: Text('Ary News'),
            ),
             PopupMenuItem<FilterList>(
              value: FilterList.bleacherReport,
              child: Text('Bleacher Report'),
            ),
             PopupMenuItem<FilterList>(
              value: FilterList.reuters,
              child: Text('Reuters'),
            ),
             PopupMenuItem<FilterList>(
              value: FilterList.cnn,
              child: Text('CNN'),
            ),
             PopupMenuItem<FilterList>(
              value: FilterList.alJazeera,
              child: Text('Al Jazeera'),
            )
          ],
        ),
      ),
    ],
  );
}
