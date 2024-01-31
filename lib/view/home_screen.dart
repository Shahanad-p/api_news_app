import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/catgories_new_model.dart';
import 'package:news_app/model/news_headlines_model.dart';
import 'package:news_app/view/category_screen.dart';
import 'package:news_app/view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum filterList { bbcNews, aryNews, bleacherReport, reuters, cnn, alJazeera }

class _HomeScreenState extends State<HomeScreen> {
  String name = 'bbc-news';
  filterList? selectedMenu;
  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MMMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'News',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategoryScreen()));
          },
          icon: Icon(Icons.apps),
          color: Colors.black,
        ),
        actions: [
          PopupMenuButton<filterList>(
              initialValue: selectedMenu,
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (filterList item) {
                if (filterList.bbcNews.name == item.name) {
                  name = 'bbc-news';
                }
                if (filterList.aryNews.name == item.name) {
                  name = 'ary-news';
                }
                if (filterList.bleacherReport.name == item.name) {
                  name = 'bleacher-report';
                }
                if (filterList.reuters.name == item.name) {
                  name = 'reuters';
                }
                if (filterList.cnn.name == item.name) {
                  name = 'cnn';
                }
                if (filterList.alJazeera.name == item.name) {
                  name = 'al-jazeera-english';
                }
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (context) => <PopupMenuEntry<filterList>>[
                    PopupMenuItem<filterList>(
                      value: filterList.bbcNews,
                      child: Text('BBC News'),
                    ),
                    PopupMenuItem<filterList>(
                      value: filterList.aryNews,
                      child: Text('Ary News'),
                    ),
                    PopupMenuItem<filterList>(
                      value: filterList.bleacherReport,
                      child: Text('Bleacher Report'),
                    ),
                    PopupMenuItem<filterList>(
                      value: filterList.reuters,
                      child: Text('Reuters'),
                    ),
                    PopupMenuItem<filterList>(
                      value: filterList.cnn,
                      child: Text('CNN'),
                    ),
                    PopupMenuItem<filterList>(
                      value: filterList.alJazeera,
                      child: Text('Al Jazeera'),
                    )
                  ])
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .55,
            width: width,
            child: FutureBuilder<NewsHeadlinesModel>(
              future: newsViewModel.fetchNewsHeadlinesFromApi(name),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitCircle(
                      size: 50,
                      color: Colors.green,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.articles!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      DateTime dateTime = DateTime.parse(snapshot
                          .data!.articles![index].publishedAt
                          .toString());
                      return SizedBox(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: height * 0.6,
                              width: width * .9,
                              padding: EdgeInsets.symmetric(
                                  horizontal: height * .02),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl: snapshot
                                      .data!.articles![index].urlToImage
                                      .toString(),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const SizedBox(
                                    child: spinkit2,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              child: Card(
                                elevation: 5,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width * 0.7,
                                        child: Text(
                                          snapshot.data!.articles![index].title
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontSize: 18.10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .1,
                                      ),
                                      SizedBox(
                                        width: width * 0.7,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .source!.name
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15.10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                format.format(dateTime),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13.10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.10),
            child: FutureBuilder<CategoriesNewsModel>(
              future: newsViewModel.fetchCategoriesNewsFromApi('General'),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitCircle(
                      size: 50,
                      color: Colors.green,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.articles!.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DateTime dateTime = DateTime.parse(snapshot
                          .data!.articles![index].publishedAt
                          .toString());
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl: snapshot
                                    .data!.articles![index].urlToImage
                                    .toString(),
                                fit: BoxFit.cover,
                                height: height * .18,
                                width: width * .3,
                                placeholder: (context, url) => const SizedBox(
                                  child: Center(
                                    child: SpinKitCircle(
                                      size: 50,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: height * .18,
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data!.articles![index].title
                                          .toString(),
                                      maxLines: 3,
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data!.articles![index]
                                              .source!.name
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          format.format(dateTime),
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

const spinkit2 = SpinKitChasingDots(
  color: Colors.amber,
  size: 50,
);
