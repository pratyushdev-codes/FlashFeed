import 'package:flutter/material.dart';
import 'package:newsapp/pages/home.dart';
import 'pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buzz Feed',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
      ),
      home:const Home()
    );
    
  }
}




