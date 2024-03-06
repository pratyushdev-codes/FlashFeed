import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Buzzz"),
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
    );
  }
}
class CategoryTitle extends StatelessWidget {
  final String categoryName;
  final String image;

  const CategoryTitle({Key key, this.categoryName, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Image.asset(image)
      ],
  }
}
