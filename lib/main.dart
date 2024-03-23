import 'package:flutter/material.dart';
import 'package:newsapp/pages/landing_page.dart'; // Import your LandingPage widget

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
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.grey,
      ),
      home: LandingPage(), // Set your LandingPage as the initial screen
    );
  }
}
