import 'package:flutter/material.dart';
import 'package:the_news/items/category/category_items.dart';
import 'package:the_news/items/vertical/news_list_view_builder.dart';
import '../items/appbars/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var sliverPadding = SliverPadding(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 10.0,
    //         ),
    //         sliver: VerticalItem(),
    //       );
    return Scaffold(
      appBar: coustom_Appbar(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                CategoryItems(),
                const SizedBox(height: 30),
              ]),
            ),
          ),
          NewsListViewBuilder(
            category: 'General'
          ),
        ],
      ),
    );
  }
}
