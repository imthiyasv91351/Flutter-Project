import 'package:flutter/material.dart';
import 'package:login_example/main.dart';
import 'package:login_example/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textController = TextEditingController();
  final _passwordController = TextEditingController();
  var username = 'username';
  var password = 'password';
  // ignore: prefer_final_fields
  bool _isDataMatched = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter username',
                  // icon: Icon(Icons.person)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value is empty";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                // onChanged: (){},
                // obscuringCharacter: "*",
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
                  // icon: Icon(
                  //   Icons.lock,
                  //   // color: kPrimaryColor,
                  // ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value is empty";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !_isDataMatched,
                    child: const Text(
                      "Username and Password doesn't match",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          // print('Data is empty');
                        }
                        // checkLogin(context);
                        setState(() {
                          username = _textController.text;
                          password = _passwordController.text;
                        });
                      },
                      child: const Text('Login')),
                ],
              ),
              Text('Username: $username'),
              Text('Password: $password')
            ],
          ),
        ),
      )),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _textController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      final _sharedPref = await SharedPreferences.getInstance();
      await _sharedPref.setBool(SAVE_KEY_NAME, true);
      //goto home
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    } else {
      // const _errorMessage = "Username and Password doesn't match";
      print("User name and pass doesn't match");

      //snackbar
      // ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
      //   content: Text(_errorMessage),
      //   backgroundColor: Colors.red,
      //   behavior: SnackBarBehavior.floating,
      //   margin: EdgeInsets.all(10),
      // ));

      // //alert dialog
      // showDialog(
      //     context: ctx,
      //     builder: (ctx1) {
      //       return AlertDialog(
      //         title: const Text("Erron"),
      //         content: const Text(_errorMessage),
      //         actions: [
      //           TextButton(
      //               onPressed: () {
      //                 Navigator.of(ctx1).pop();
      //               },
      //               child: const Text('Close'))
      //         ],
      //       );
      //     });

      // //show text
      // setState(() {
      //   _isDataMatched = false;
      // });
    }
  }
}
