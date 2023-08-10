import 'dart:convert';

import 'package:liptone_news/model/article_model.dart';
import 'package:http/http.dart';


class News {
  List<ArticleModel> new = [];

  Future<void> getNews() async{
     String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5825b03a91b44f0f967f61bfc247e09b";

     var response = await http.get(url);
     var jsonData = jsonDecode(response.body);
     if (jsonData['status']=='OK'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
            content: element['context']
          );
          News.add(articleModel);
        }
      })
     }
  }
 

  
}