
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/models/category_model.dart'; // Importing CategoryModel
import 'package:newsapp/services/data.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/services/slider_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Home extends StatefulWidget {
  const Home({Key? key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders =[];

  int activeIndex= 0;
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
            Text(
                "Buzz",
                style:TextStyle(
                  color: Colors.grey,)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height:10.0,),
          Padding(

              padding: const EdgeInsets.only(left: 10.0, right:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Breaking News!", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 18.0),),
                  Text("View all", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500, fontSize: 16.0),),
                ],
              ),

          ),
          SizedBox(
            height:20.0,),

          CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder:(context, index, realIndex) {
                String? res = sliders[index].image;
                String? res1 = sliders[index].name;
                return buildImage(res!, index ,res1!);
              },

              options:CarouselOptions(
                  height: 200, autoPlay: true,enlargeCenterPage: true, enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason){
                    setState(() {
                      activeIndex=index;
                    });
                  }
              ) ),
          SizedBox(height: 30.0,),
          Center(child : buildIndicator()),


          SizedBox(height:10.0,),
          Padding(

            padding: const EdgeInsets.only(left: 10.0, right:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Trending News", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 18.0),),
                Text("View all", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500, fontSize: 16.0),),
              ],
            ),

          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(children: [
              Container(
                child: ClipRRect
                
                  (borderRadius: BorderRadius.circular(10),
                    child: Image.asset(("images/ent.jpeg"),height: 50,width: 150,fit: BoxFit.cover)),


              )
            ],),
          )
        ],
      ),

    );

  }
  Widget buildIndicator()=>AnimatedSmoothIndicator(
    activeIndex:activeIndex ,
    count:sliders.length,
    effect:SlideEffect(dotWidth: 15, dotHeight: 14, activeDotColor:Colors.blue, )

  );

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
  margin:EdgeInsets.symmetric(horizontal: 5.0),
  child:Stack(
      children:[

        ClipRRect(
          borderRadius: BorderRadius.circular(10),

          child:Image.asset(
            image ,
            fit:BoxFit.cover,


          ),
        ),
        Container(
          height:250,
          padding:EdgeInsets.only(left:10.0),
          margin:EdgeInsets.only(top:130.0),
          // width: MediaQuery.of().size.width,
          decoration: BoxDecoration(color:Colors.black26, borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20), bottomRight: Radius.circular(20) ,)),
          child:Text(name, style:TextStyle(color:Colors.white , fontSize:16.0, fontWeight: FontWeight.w500),),
        )
      ]),
);







