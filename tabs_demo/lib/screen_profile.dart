import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs_demo/provider/provider_demo.dart';

class ProfileScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final name;
  // ignore: use_key_in_widget_constructors
  const ProfileScreen({this.name});
  // const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: Colors.purple),
          )),
          Consumer<ProviderDemo>(
            builder: (BuildContext context, value, Widget? child) {
              // print('Consumer rebuild');
              return Text(value.test);
            },
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<ProviderDemo>(context, listen: false)
                    .changeValue('Change');
              },
              child: const Text('Click')),
          // Provider.of<ProviderDemo>(context).widget()
        ],
      ),
    );
  }
}
