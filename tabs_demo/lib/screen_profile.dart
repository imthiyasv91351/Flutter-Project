import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final name;
  String email;

  // ignore: prefer_typing_uninitialized_variables
  var id;
  // ignore: use_key_in_widget_constructors
  ProfileScreen({
    required this.id,
    required this.name,
    required this.email,
  });
  // const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: $id',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.purple)),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Name:',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.purple),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.purple),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'email:',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.purple),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              email,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
