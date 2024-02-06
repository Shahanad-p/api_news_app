import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/catgories_new_model.dart';
import 'package:news_app/view/category_details/category_details_screen.dart';
import 'package:provider/provider.dart';
import '../../Controller/home_provider.dart';

Widget homeCategoryBuild(double height, double width) {
  return Consumer<HomeProvider>(
    builder: (context, value, child) => Padding(
      padding: const EdgeInsets.all(18.10),
      child: FutureBuilder<CategoriesNewsModel>(
        future: value.newsViewModel.fetchCategoriesNewsFromApi('General'),
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
                DateTime dateTime = DateTime.parse(
                    snapshot.data!.articles![index].publishedAt.toString());
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryDetailScreen(
                            newsImage: snapshot.data!.articles![index].urlToImage
                                .toString(),
                            newsTitle: snapshot.data!.articles![index].title
                                .toString(),
                            newsDate: snapshot
                                .data!.articles![index].publishedAt
                                .toString(),
                            author: snapshot.data!.articles![index].author
                                .toString(),
                            description: snapshot
                                .data!.articles![index].description
                                .toString(),
                            content: snapshot.data!.articles![index].content
                                .toString(),
                            source: snapshot.data!.articles![index].source!.name
                                .toString())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data!.articles![index].urlToImage
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
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: height * .18,
                            padding: const EdgeInsets.only(left: 15),
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot
                                          .data!.articles![index].source!.name
                                          .toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      value.format.format(dateTime),
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
                  ),
                );
              },
            );
          }
        }),
      ),
    ),
  );
}
