import 'package:flutter/material.dart';
import 'package:login_example/main.dart';
import 'package:login_example/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: const SafeArea(child: Center(child: Text('Home'))),
    );
  }

  signout(BuildContext context) async {
    final _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const LoginScreen()),
        (route) => false);
  }
}
