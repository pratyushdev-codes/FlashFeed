import 'dart:convert';
import 'package:http/http.dart' as http; // Don't forget to import the http package!
import 'package:FlashFeed/models/show_category.dart';
import 'package:FlashFeed/models/slider_model.dart';

class ShowCategoryNews{
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoriesNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=54750057c9694620a9109147b238936b";
    var response = await http.get(Uri.parse(url)); // Corrected the syntax here

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ShowCategoryModel categoryModel = ShowCategoryModel(
            title: element['title'],
            description: element['description'],
            author: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          categories.add(categoryModel); // Added the articleModel to the news list
        }
      });
    }
  }
}
