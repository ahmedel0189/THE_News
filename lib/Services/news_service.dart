import 'package:dio/dio.dart';
import 'package:the_news/Services/Models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getGeneralnews({
    required category,
  }) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/everything?q={$category}&language=en&apiKey=b9cb1e660adb4297af42679da850d610',
      );
      // ? getting all jason data
      Map<String, dynamic> jsonData =
          response.data;
      // ? select the json articles
      List<dynamic> articles =
          jsonData['articles'];

      // ? convert json to dart object
      List<ArticleModel> articlesList = [];
      // ? convert list of json to list of objects
      for (var article in articles) {
        ArticleModel articleModel =
            ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }

      // for (var article in articles) {
      //   ArticleModel articleModel = ArticleModel(
      //     image: article['urlToImage'],
      //     title: article['title'],
      //     description: article['description'],
      //     source: Source(
      //       id: article['source']['id'],
      //       name: article['source']['name'],
      //     ),
      //     url: article['url'],
      //   );
      //   articlesList.add(articleModel);
      // }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
