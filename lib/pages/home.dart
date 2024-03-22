import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/pages/article_view.dart';
import 'package:newsapp/services/News.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/services/data.dart';
import 'package:newsapp/services/slider_data.dart';
import 'package:intl/intl.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Buzz",
              style: TextStyle(
                color: Colors.black54,
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
        elevation: 0.0,
      ),

        body: _loading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                            image:
                                categories[index].image ?? 'default_image.png',
                            categoryName: categories[index].categoryName ??
                                'Uncategorized',
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
                            child: Text(
                              "Let's dive into ${DateFormat('EEEE').format(DateTime.now())}'s headlines!",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Material(
                              elevation: 3.0,
                              borderRadius: BorderRadius.circular(30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "images/News of the Day.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Breaking News",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white60),
                                ),
                                onPressed: () {
                                  // Add your onPressed action here
                                },
                                child: Text(
                                  "Read More",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        CarouselSlider.builder(
                          itemCount: sliders.length,
                          itemBuilder: (context, index, realIndex) {
                            String? res = sliders[index].urlToImage;
                            String? res1 = sliders[index].title;
                            return buildImage(res!, index, res1!);
                          },
                          options: CarouselOptions(
                            height: 180,
                            viewportFraction: 2,
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
                        SizedBox(
                          height: 25.0,
                        ),
                        Center(
                          child: buildIndicator(),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Trending News",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  // Add your onPressed action here
                                },
                                child: Text(
                                  "Read More",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return BlogTitle(
                                  url:articles[index].url!,
                                  desc: articles[index].description!,
                                  title: articles[index].title!,
                                  imageUrl: articles[index].urlToImage!);
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
      );

  }

  Widget buildImage(String image, int index, String name) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(

                // height: 250,
                fit: BoxFit.cover, imageUrl: 'image',
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.only(left: 10.0),
              margin: EdgeInsets.only(top: 130.0),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
    return Container(
      margin: EdgeInsets.only(right: 16),
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
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlogTitle extends StatelessWidget {
  String imageUrl, title, desc, url;
  BlogTitle({required this.desc, required this.title, required this.imageUrl, required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl:url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
          elevation: 3.0,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 5.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 140,
                      width: 145,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
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
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black54,
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
