// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:the_news/Services/Models/article_model.dart';
import 'package:the_news/helper/webviewer.dart';

class Verti_Card extends StatefulWidget {
  const Verti_Card({
    super.key,
    required this.articleModel,
  });
  final ArticleModel articleModel;

  @override
  State<Verti_Card> createState() =>
      _Verti_CardState();
}

class _Verti_CardState extends State<Verti_Card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              url: widget.articleModel.url,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          // ? to start the laung from the left or the right
          // crossAxisAlignment:
          //     CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
              child: Image.network(
                widget.articleModel.image ?? '',
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) {
                      return Image.asset(
                        'assets/news-placeholder.png',
                      );
                    },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // ? title
                  Text(
                    widget.articleModel.title ??
                        '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ? description
                  Text(
                    widget
                            .articleModel
                            .description ??
                        '',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow:
                        TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
