import 'package:flutter/material.dart';
import 'package:login_example/main.dart';
import 'package:login_example/screens/home.dart';
import 'package:login_example/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    // goToLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'lib/assets/images/wait.png',
        height: 200,
      )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const LoginScreen()));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPref = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPref.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      goToLogin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    }
  }
}
