import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:FlashFeed/models/article_model.dart';
import 'package:flutter_tts/flutter_tts.dart';

class News extends GetxController {
  RxBool isSpeaking = false.obs;
  FlutterTts flutterTts = FlutterTts();
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=entertainment&general&buisness&technology&science&apiKey=ab736851528d409793eb3db0f1230abe";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }

  Future<void> speak(String text) async {
    isSpeaking.value = true;
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4);

    // Handle completion of speech
    flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;
    });

    await flutterTts.speak(text);
  }

  Future<void> stop() async {
    await flutterTts.stop();
    isSpeaking.value = false;
  }
}
