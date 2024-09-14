import 'dart:convert';
import 'package:http/http.dart' as http; // Don't forget to import the http package!
import 'package:FlashFeed/models/slider_model.dart';

class Sliders {
  List<sliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=ab736851528d409793eb3db0f1230abe";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          sliderModel slidermodel = sliderModel(
            title: element['title'],
            description: element['description'],
            author: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          sliders.add(slidermodel); // Added the articleModel to the news list
        }
      });
    }
  }
}
