import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart'; // Importing CategoryModel
import 'package:newsapp/services/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    categories = getCategories();
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
      body: Container(
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
           return CategoryTitle(
  image: categories[index].image ?? 'default_image.png',
  categoryName: categories[index].categoryName ?? 'Uncategorized',
);

          },
        ),
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
      child: Stack(
        children: [
          Image.asset(
            image,
            width: 120,
            height: 60,
          ),
        ],
      ),
    );
  }
}
