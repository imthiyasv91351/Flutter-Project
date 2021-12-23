import 'package:flutter/material.dart';
// import 'package:list_demo/list_view.dart';
import 'package:list_demo/screen_1.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:list_demo/screen_2.dart';
// late SharedPreferences sharedPreferences;

Future<void> main() async {
  // sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenOne(),
      // routes: {
      //   'screen_1': (ctx) {
      //     return const ScreenOne();
      //   },
      //   'screen_2': (ctx) {
      //     return const ScreenTwo();
      //   }
      // },
    );
  }
}
