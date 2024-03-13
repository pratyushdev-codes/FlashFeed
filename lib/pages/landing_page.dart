import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(

        children: [
       Material(
         elevation: 3.0,
         borderRadius: BorderRadius.circular(30),
         child: ClipRRect(
           borderRadius: BorderRadius.circular(20),
         child: Image.asset("images/intro.webp",
          height: MediaQuery.of(context).size.width,
          width:MediaQuery.of(context).size.width/1.7,
           fit:BoxFit.cover,
             ),
         
              ),
       ), SizedBox(height: 20.0),
          Text("News from around the\n    world for you", style: TextStyle(color: Colors.black , fontSize: 20.0 , fontWeight:FontWeight.bold )),
          Text("Best time to read , take your time to read a\n    litter more about this world", style: TextStyle(color: Colors.black45 , fontSize: 18.0 , fontWeight:FontWeight.w500 )),
          SizedBox(height: 40.0),
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            child: Material(
            borderRadius: BorderRadius.circular(30),
              elevation: 5.0,
              child: Container(

                decoration: BoxDecoration(color: Colors.blue),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Center(child: Text("Get Started", style: TextStyle(color: Colors.white),)),
              ),
            ),
          )


    ],
      ),

    )






  );

  }
}

