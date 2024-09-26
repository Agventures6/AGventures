import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'intro.dart';  // Import the IntroPage file
import 'login.dart';  // Import the LoginPage file
import 'signup.dart';  // Import the SignUpPage file
import 'home.dart';  // Import the HomePage file
import 'drone_view_page.dart';  // Import the DroneViewPage file
import 'camera_page.dart';  // Import the CameraPage file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Agventure());
}

class Agventure extends StatelessWidget {
  const Agventure({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agventure',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',  // Set the initial route
      routes: {
        '/': (context) => IntroPage(),  // Set the initial route to IntroPage
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => Homepage(),
        '/drone': (context) => DroneViewPage(),
        '/camera': (context) => CameraPage(),  // Add the CameraPage route
      },
    );
  }
}
