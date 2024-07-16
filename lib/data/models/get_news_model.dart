class GetNewsModel {
  final String status;
  final int totalResults;
  final List<Article> articles;

  GetNewsModel(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory GetNewsModel.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List;
    List<Article> articlesList = list.map((i) => Article.fromJson(i)).toList();

    return GetNewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articlesList,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'status': status,
  //     'totalResults': totalResults,
  //     'articles': articles.map((e) => e.toJson()).toList(),
  //   };
  // }
}

class Article {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

class Source {
  final String? id;
  final String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
