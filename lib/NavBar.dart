import 'package:FlashFeed/pages/PoliciesPage.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                  accountName: const Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.white60,
                    ),
                  ),
                  accountEmail: const Text(
                    'Breaking news, tailored just for you!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('images/navbarimg.jpeg'),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Share'),
                  onTap: () {
                    Share.share(
                      'https://flashfeedweb.vercel.app',
                      subject: 'Flash Feed - Stay Ahead of the Curve',
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('Policies'),
                  onTap: () {
                    // Navigate to the Policies page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PoliciesPage()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.contact_phone),
                  title: const Text('Contact'),
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactPage()),
                  );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Email: birole.pratyush@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'GitHub: pratyushdev-codes',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PoliciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Policies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Data Collection',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '(i) No Personal Data Collection: Flash Feed does not collect, store, or process any personal data from its users. All interactions within the app are anonymous.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '(ii) Third-Party API: The news content displayed in Flash Feed is sourced from third-party APIs. We do not have control over the data provided by these APIs.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Data Usage',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '(i) Non-Personal Data: We may collect non-personal data, such as device type and operating system, to improve the app\'s functionality and user experience.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '(ii) Cookies and Tracking Technologies: Flash Feed does not use cookies or any tracking technologies to monitor user activity within the app.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Data Security',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '(i) Secure Connections: All data transfers between Flash Feed and the third-party API are secured using industry-standard encryption protocols.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '(ii) No Data Retention: Since no personal data is collected, there is no data retention policy needed. Flash Feed does not store any user-related information.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
