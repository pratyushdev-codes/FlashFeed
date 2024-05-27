import 'package:flutter/material.dart';
import 'package:share/share.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30, color: Colors.white60),
                  ),
                  accountEmail: Text('Breaking news, tailored just for you !', // Add your subheading text here
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('images/navbarimg.jpeg'),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share'),
                  onTap: () {
                    // Share the URL when the share button is pressed
                    Share.share('https://flashfeedweb.netlify.app', subject: 'Flash Feed - Stay Ahead of the Curve');
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text('Policies'),
                  onTap: () => null,
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.contact_phone), // Added contact icon
                  title: Text('Contact'),
                  onTap: () => null,
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}