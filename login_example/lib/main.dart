import 'package:flutter/material.dart';
import 'package:login_example/screens/login.dart';
import 'package:login_example/screens/splash.dart';

const SAVE_KEY_NAME = 'userLoggedIn';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
