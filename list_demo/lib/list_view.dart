import 'package:flutter/material.dart';

// ignore: camel_case_types
class List_View extends StatelessWidget {
  const List_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Example"),
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text('Person $index'),
                  subtitle: Text('Message $index'),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/img/avatar.png'),
                  ),
                  trailing: Text('1$index:05 PM'),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: 10)),
    );
  }
}
