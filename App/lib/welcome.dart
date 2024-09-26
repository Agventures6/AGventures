import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  // Function to launch URL
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://drive.google.com/file/d/18ID4k2zH0Xs5i8_ZsklBm7guDf34YIJh/view?usp=drivesdk');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGventures'),
        backgroundColor: Colors.green[700],
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to the login page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white, // White text on the action button
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the AGventures !!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/farmer.jpg', // Updated to use farmer.jpg
              height: 250, // Adjust height as necessary
            ),
            const SizedBox(height: 20), // Spacing between image and text
            const Text(
              '"From Field to Market,\nYour Agri-Mart Solution!"',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Spacing between subtitle and manual link
            InkWell(
              onTap: _launchURL, // Call the function to launch the URL
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Manual',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.link, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
