
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/models/category_model.dart'; // Importing CategoryModel
import 'package:newsapp/services/data.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/services/slider_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Home extends StatefulWidget {
   const Home({Key? key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders =[];
  @override
  void initState() {
    categories = getCategories();
    sliders=getSliders();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Buzz"),
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
      body: Column(
        children: [
          Container(
            height:70,
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
          CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder:(context, index, realIndex) {
                String? res = sliders[index].image;
                String? res1 = sliders[index].name;
                return buildImage(res!, index ,res1!);
              },

              options:CarouselOptions(height: 200, viewportFraction: 1, enlargeCenterPage: true, enlargeStrategy: CenterPageEnlargeStrategy.height) )
        ],
      ),

    );
  }

}
class CategoryTitle extends StatelessWidget {
  final String image, categoryName;
  CategoryTitle({required this.categoryName, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
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
// class buildImage extends StatelessWidget {
//    String img = '';
//    String name="";
//    buildImage(@required Img, @required name){
//     img = Img;
//    }

  // @override
  // Widget build(BuildContext context) {
  //   return  Container(
  //       child:Image.asset(img, fit: BoxFit.cover,width:MediaQuery.of(context).size.width
  //   ));
  // }
// }

Widget buildImage(String image , int index, String name)=>Container(
  child:Image.asset(
    image ,
    fit:BoxFit.cover,

  ),
);
