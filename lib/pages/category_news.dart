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
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 3.0,
      ),
      body: _loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
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
          Image.network(
            imageUrl,
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover,
          ),
          Text(title),
          Text(description),
        ],
      ),
    );
  }
}
