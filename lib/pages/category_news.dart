import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/show_category.dart';
import 'package:newsapp/pages/article_view.dart';
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

  final ScrollController _scrollController = ScrollController();

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
      body: _loading
          ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Change color to blue
        ),
      )
          : Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ShowCategory(
              imageUrl: categories[index].urlToImage!,
              description: categories[index].description!,
              title: categories[index].title!,
              url: categories[index].url!, // Pass URL to ShowCategory widget
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 28,
        color: Colors.transparent,
      ),
      floatingActionButton: Container(
        width: 110.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              0,
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          },
          child: Icon(Icons.arrow_upward, color: Colors.white70),
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ), // FAB background color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ShowCategory extends StatelessWidget {
  final String imageUrl, description, title, url;

  const ShowCategory({
    Key? key,
    required this.imageUrl,
    required this.description,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url))); // Use MaterialPageRoute to navigate to ArticleView
      },
      child: Container(
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
            Text(title,
                style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 7.0),
            Text(description, style: TextStyle(color: Colors.white, fontSize: 15), maxLines: 3,),
            SizedBox(height: 17.0),
          ],
        ),
      ),
    );
  }
}
