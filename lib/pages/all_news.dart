import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:FlashFeed/models/slider_model.dart';
import 'package:FlashFeed/pages/article_view.dart';
import 'package:FlashFeed/models/article_model.dart';
import 'package:FlashFeed/services/news.dart';
import 'package:FlashFeed/services/slider_data.dart';

class AllNews extends StatefulWidget {
  final String news;

  AllNews({required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  late List<sliderModel> sliders;
  late List<ArticleModel> articles;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
    getSlider();
  }

  Future<void> getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    setState(() {
      articles = newsclass.news;
      _loading = false;
    });
  }

  Future<void> getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    setState(() {
      sliders = slider.sliders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.news} News',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Feed.",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 3.0,
        iconTheme: IconThemeData(
          color: Colors.white70, // Change the color of the back button icon
        ),
      ),
      body: _loading
          ? Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      )
          : ListView.builder(
        itemCount: widget.news == "Breaking" ? sliders.length : articles.length,
        itemBuilder: (context, index) {
          return AllNewsSection(
            imageUrl: widget.news == "Breaking" ? sliders[index].urlToImage! : articles[index].urlToImage!,
            description: widget.news == "Breaking" ? sliders[index].description! : articles[index].description!,
            title: widget.news == "Breaking" ? sliders[index].title! : articles[index].title!,
            url: widget.news == "Breaking" ? sliders[index].url! : articles[index].url!,
          );
        },
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  final String imageUrl, description, title, url;

  const AllNewsSection({
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)),
        );
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
                // Placeholder widget

                // Error widget
                errorWidget: (context, url, error) => Icon(Icons.error),
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
