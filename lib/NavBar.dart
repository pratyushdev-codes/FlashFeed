import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,


        children: [
          UserAccountsDrawerHeader(
            accountName: Padding(
              padding: const EdgeInsets.all(0.00001),
              child: Text('Welcome !',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),),
            ),
            accountEmail: Text(''),

            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('images/navbarimg.jpeg')),
            ),
          ),


          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}