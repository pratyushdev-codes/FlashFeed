import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/show_category.dart';
import 'package:newsapp/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  final String name;

  const CategoryNews({Key? key, required this.name}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  late List<ShowCategoryModel> categories;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name);
    setState(() {
      categories = showCategoryNews.categories;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.name,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 3.0,
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),

          child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ShowCategory(
              imageUrl: categories[index].urlToImage!,
              description: categories[index].description!,
              title: categories[index].title!,
            );
          },
        ),
      ),
    );
  }
}

class ShowCategory extends StatelessWidget {
  final String imageUrl, description, title;

  const ShowCategory({
    Key? key,
    required this.imageUrl,
    required this.description,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),

            child: Image.network(
              imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.0),
          Text(title, style: TextStyle(color: Colors.blue ,fontSize: 18 ,fontWeight: FontWeight.w500)),
          SizedBox(height: 7.0),
          Text(description ,style: TextStyle(color: Colors.white ,fontSize: 15,)),
          SizedBox(height: 17.0),
        ],

      ),
    );
  }
}
