import 'dart:convert';
import 'package:liptone_news/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5825b03a91b44f0f967f61bfc247e09b";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"] ?? "Unknown Author",
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'] ?? "Unknown",
          );
          news.add(articleModel);
        }
      });
    }
  }
}
