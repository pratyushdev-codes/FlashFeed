import 'dart:convert';
import 'package:http/http.dart' as http; // Don't forget to import the http package!
import 'package:newsapp/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines??country=in&sources=techcrunch&apiKey=e2e26edc65b74ec395ce51cd5ee6790c";
    var response = await http.get(Uri.parse(url)); // Corrected the syntax here

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            author: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel); // Added the articleModel to the news list
        }
      });
    }
  }
}
