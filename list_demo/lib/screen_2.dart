import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  // final String name;

  // const ScreenTwo({Key? key, required this.name}) : super(key: key);

  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(name),
        // ),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Value is found'),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: const Text("Goto back"))
        ],
      ),
    ));
  }
}
