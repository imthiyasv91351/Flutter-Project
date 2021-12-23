import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs_demo/home_screen.dart';
import 'package:tabs_demo/provider/provider_demo.dart';
import 'package:tabs_demo/provider/provider_demo2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderDemo()),
        ChangeNotifierProvider(create: (context) => ProviderDemo2())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple,
        ),
        home: const ScreenHome(),
      ),
    );
  }
}
