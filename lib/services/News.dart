import 'dart:convert';

import 'package:newsapp/models/article_model.dart';

class News{
  List <ArticleModel> news =[];


  Future<void> getNews() async=>{
    String url="https://newsapi.org/v2/everything?q=tesla&from=2024-02-13&sortBy=publishedAt&apiKey=54750057c9694620a9109147b238936b",
    var response = await http.get(Uri.parse(url)),

    var jsonData = jsonDecode(response.body);
    if(jsonData['status']= 'ok''){
      jsonData['articles'].forEach((element){
        if(element.['urlToImage']!=null && element.['description']){}
        ArticleModel articleModel = ArticleModel(

        );






  })
  }

  }
}
