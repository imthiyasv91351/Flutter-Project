import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs_demo/provider/provider_demo.dart';
import 'package:tabs_demo/services/posts_api.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  String content;
  int userID;

  // ignore: prefer_typing_uninitialized_variables
  var id;
  // ignore: use_key_in_widget_constructors
  ProfileScreen(
      {required this.id,
      required this.title,
      required this.content,
      required this.userID});
  // const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text(id.toString()),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User ID: $userID',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.purple)),
            Text('ID: $id',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.purple)),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Title:',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.purple),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.purple),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Content:',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.purple),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              content,
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
