import 'package:flutter/material.dart';
import 'package:newsapp/pages/home.dart';
import 'package:newsapp/NavBar.dart'; // Import your NavBar widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buzz Feed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(

       // Set your NavBar widget as the drawer
        body: const Home(),
      ),
    );
  }
}
