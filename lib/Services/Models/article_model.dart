class ArticleModel {
  final String? image;
  final String title;
  final String? description;
  final Source? source;
  final String url;

  ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    this.source,
    required this.url,
  });

  // 🔹 Factory constructor
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      source: json['source'] != null
          ? Source.fromJson(json['source'])
          : null,
      url: json['url'],
    );
  }
}

class Source {
  final String? id;
  final String? name;

  Source({required this.id, required this.name});

  // 🔹 Factory constructor
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
