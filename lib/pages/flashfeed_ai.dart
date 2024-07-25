import 'package:flutter/material.dart';

class FlashfeedAI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flash",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
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
        elevation: 3.0,
        iconTheme: IconThemeData(
          color: Colors.white54, // Change the color of the back button icon
        ),

      ),
      body: Center(
        child: Text('Welcome to Flashfeed AI!'),
      ),
    );
  }
}
