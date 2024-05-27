import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:FlashFeed/NavBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:FlashFeed/models/article_model.dart';
import 'package:FlashFeed/pages/all_news.dart';
import 'package:FlashFeed/pages/article_view.dart';
import 'package:FlashFeed/pages/category_news.dart';
import 'package:FlashFeed/services/News.dart';
import 'package:FlashFeed/models/category_model.dart';
import 'package:FlashFeed/models/slider_model.dart';
import 'package:FlashFeed/services/data.dart';
import 'package:FlashFeed/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  int activeIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNew();
    getSlider();
  }

  getNew() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flash",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Feed",
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
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white70),
            onPressed: () {
              setState(() {
                _loading = true;
              });
              getNew();
              getSlider();
            },
          ),
        ],
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ))
          : SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 65,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTitle(
                    image: categories[index].image ?? 'default_image.png',
                    categoryName: categories[index].categoryName ?? 'Uncategorized',
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 19.5,
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: "Let's dive into ",
                          ),
                          TextSpan(
                            text: "${DateFormat('EEEE').format(DateTime.now())}'s ", // Day of the week
                            style: TextStyle(
                              color: Colors.blue, // Blue color for the day
                            ),
                          ),
                          TextSpan(
                            text: "headlines",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.0),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 0.0), // Add white border
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white12,
                              blurRadius: 10.0, // Adjust the blur radius to your liking
                              spreadRadius: 0.4, // Adjust the spread radius to your liking
                              // Adjust the offset if needed
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: Image.asset(
                            "images/News of the Day (1).png",
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Breaking News",
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AllNews(news:"Breaking")),
                          );
                        },
                        child: Text(
                          "Read More ➜",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                CarouselSlider.builder(
                  itemCount: sliders.length,
                  itemBuilder: (context, index, realIndex) {
                    String? res = sliders[index].urlToImage;
                    String? res1 = sliders[index].title;
                    return buildImage(res!, index, res1!);
                  },
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 0.95,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: 17.0),
                Center(
                  child: buildIndicator(),
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending News",
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AllNews(news:"Trending")),
                          );
                        },
                        child: Text(
                          "Read More ➜",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return BlogTitle(
                        url: articles[index].url!,
                        desc: articles[index].description!,
                        title: articles[index].title!,
                        imageUrl: articles[index].urlToImage!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 28,
        // Set the color to transparent
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
          child: Icon(Icons.arrow_upward ,color:Colors.white70),
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ), // FAB background color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 10.0),
          margin: EdgeInsets.only(top: 130.0),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: sliders.length,
    effect: SlideEffect(
      dotWidth: 9,
      dotHeight: 9,
      activeDotColor: Colors.blueAccent,
    ),
  );
}

class CategoryTitle extends StatelessWidget {
  final String image, categoryName;
  const CategoryTitle(
      {Key? key, required this.categoryName, required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(name:categoryName)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8, left: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Image.asset(
                image,
                width: 135,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 135,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360),
                color: Colors.black26,
              ),
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTitle extends StatelessWidget {
  final String imageUrl, title, desc, url;
  const BlogTitle({Key? key, required this.desc, required this.title, required this.imageUrl, required this.url}) : super(key: key);
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
        margin: EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
          elevation: 1.5,
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 140,
                    width: 145,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 9.0),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        title,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        desc,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
