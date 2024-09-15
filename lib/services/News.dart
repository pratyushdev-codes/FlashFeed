import 'dart:convert';
import 'package:http/http.dart' as http; // Don't forget to import the http package!
import 'package:FlashFeed/models/article_model.dart';
import 'package:flutter_tts/flutter_tts.dart';


FlutterTts flutterTts =FlutterTts();

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=76a443dc1c5945d591bf5a452b431990";
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

    Future<void> speak (String description) async{
      await flutterTts.setLanguage("en-us");
      await flutterTts.setPitch(1);
      await flutterTts.setSpeechRate(0.8);
      await flutterTts.speak(description);

    }
  }
}