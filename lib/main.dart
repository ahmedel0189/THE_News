import 'package:flutter/material.dart';
import 'package:the_news/screens/home_Page.dart';

class TheNews extends StatelessWidget {
  const TheNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The News',
      home: HomePage(),
    );
  }
}

void main() {
  runApp(const TheNews());
}
