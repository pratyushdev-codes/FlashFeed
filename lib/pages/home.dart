import 'dart:html';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/services/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

List <CategoryModel>  categories =[];
@override
void initState(){
  categories = getCategories();
   super.initState();

}


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Row(
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
      body: Container(
        child: Coloumn(childern:[
          Container(child: ListView.builder,)

        ])





      )



    );
  }
}
class CategoryTitle extends StatelessWidget {
final image ,categoryName;
CategoryTitle({this.categoryName,this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
child:Stack(
  children: [
    Image.asset(image ,
  width:120,
  height:60,)
  
  
  ],
)






    );
  }
}