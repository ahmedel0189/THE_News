import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:the_news/Services/Models/article_model.dart';
// import 'package:the_news/Services/Models/article_model.dart';
import 'package:the_news/Services/news_service.dart';
import 'package:the_news/items/vertical/vertical_item.dart';

Widget _buildSliverMessage({
  required Widget child,
}) {
  return SliverFillRemaining(
    hasScrollBody: false,
    child: Center(child: child),
  );
}

class NewsListViewBuilder extends StatefulWidget {
  final String category;
  const NewsListViewBuilder({
    super.key,
    required this.category,
  });

  @override
  State<NewsListViewBuilder> createState() =>
      _NewsListViewBuilderState();
}

class _NewsListViewBuilderState
    extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = NewsService(
      Dio(),
    ).getGeneralnews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: futureData,
      builder: (context, snapshot) {
        // ? Waiting
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return _buildSliverMessage(
            child: CircularProgressIndicator(),
          ); // لسه بيجيب البيانات
        }
        // ? Connection error
        else if (snapshot.connectionState ==
            ConnectionState.none) {
          return _buildSliverMessage(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ); // حصل خطأ
        }
        // ? has the data
        else if (snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          return VerticalItem(
            articles: snapshot.data!,
          ); // البيانات وصلت
        }
        // ? else
        else {
          return _buildSliverMessage(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ); // لو مفيش بيانات
        }
      },
    );
  }
}
