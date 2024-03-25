import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryNews extends StatefulWidget {
  const CategoryNews({super.key});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  String name;
  CategoryNews({required this.name});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.black,
        title: Text(
                 widget.name;
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "Feed.",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 3.0,
      ),

      body:Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}

class ShowCategory extends StatelessWidget {
String Image , desc, title;
ShowCategory({required this.Image , required this.desc, required this.title});





  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CachedNetworkImage(imageUrl: Image, width: MediaQuery.of(context).size.width,height: 200, fit: BoxFit.cover,),
        Text(title),
        Text(desc),
      ],),


    );
  }
}
