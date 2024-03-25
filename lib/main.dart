import 'package:flutter/material.dart';
import 'package:FlashFeed/pages/home.dart';
import 'package:FlashFeed/pages/landing_page.dart'; // Import your LandingPage widget
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('first_time') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({Key? key, required this.isFirstTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlashFeed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.grey,
      ),
      home: isFirstTime ? LandingPage() : Home(), // Show LandingPage if it's the first time, else show Home
    );
  }
}
