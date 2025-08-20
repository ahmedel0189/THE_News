import 'package:flutter/material.dart';
// import 'package:the_news/data/horizntal_card_data.dart';
import 'package:the_news/items/appbars/category_appbar.dart';
import 'package:the_news/items/vertical/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  final String title;
  const CategoryView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppbar(card_text: title),
      body: CustomScrollView(
        slivers: [NewsListViewBuilder(category: title,)],
      ),
    );
  }
}
