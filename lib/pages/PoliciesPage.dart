import 'package:flutter/material.dart';

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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Data Collection',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '(i) No Personal Data Collection: Flash Feed does not collect, store, or process any personal data from its users. All interactions within the app are anonymous.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '(ii) Third-Party API: The news content displayed in Flash Feed is sourced from third-party APIs. We do not have control over the data provided by these APIs.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Data Usage',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '(i) Non-Personal Data: We may collect non-personal data, such as device type and operating system, to improve the app\'s functionality and user experience.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '(ii) Cookies and Tracking Technologies: Flash Feed does not use cookies or any tracking technologies to monitor user activity within the app.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Data Security',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '(i) Secure Connections: All data transfers between Flash Feed and the third-party API are secured using industry-standard encryption protocols.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '(ii) No Data Retention: Since no personal data is collected, there is no data retention policy needed. Flash Feed does not store any user-related information.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
