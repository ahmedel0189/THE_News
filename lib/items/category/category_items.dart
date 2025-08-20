import 'package:flutter/material.dart';
import 'package:the_news/data/horizntal_card_data.dart';
import 'package:the_news/items/category/category_cards.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: H_card.length,
        itemBuilder: (context, index) {
          return CategoryCards(
            card_text:
                H_card[index]['card_text']!,
            image_path: H_card[index]['image']!,
          );
        },
      ),
    );
  }
}
