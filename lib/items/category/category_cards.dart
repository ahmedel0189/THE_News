import 'package:flutter/material.dart';
// import 'package:the_news/data/horizntal_card_data.dart' show H_card;
import 'package:the_news/screens/category_view.dart';

class CategoryCards extends StatelessWidget {
  final String? image_path;
  final String? card_text;
  const CategoryCards({
    super.key,
    required this.image_path,
    required this.card_text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                title: card_text!,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Stack(
          children: [
            // ? image bacground container
            Container(
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image_path!),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.circular(12),
              ),
            ),
            // ? blask shadow container
            Container(
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(
                  .4,
                ),
                borderRadius:
                    BorderRadius.circular(12),
              ),
            ),
            // ? text Positioned
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  card_text!,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Tajawal',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
