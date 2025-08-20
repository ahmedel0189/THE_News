import 'package:flutter/material.dart';
import 'package:the_news/Services/Models/article_model.dart';
import 'package:the_news/items/vertical/vertical_card.dart';

class VerticalItem extends StatelessWidget {
  final List<ArticleModel> articles;
  const VerticalItem({
    super.key,
    required this.articles,
  });
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length > 10
            ? 10
            : articles.length,
        (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 1),
            child: Verti_Card(
              articleModel: articles[index],
            ),
          );
        },
      ),
    );
  }
}
