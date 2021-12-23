import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs_demo/provider/provider_demo.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var departments = Provider.of<ProviderDemo>(context).department;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Department'),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(
                departments[index],
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.purple),
              ),
              // subtitle: Text('Message $index'),
              // leading: const CircleAvatar(
              //   radius: 30,
              //   backgroundImage: AssetImage('assets/img/avatar.png'),
              // ),
              // trailing: Text('1$index:05 PM'),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider(
              height: 30,
            );
          },
          itemCount: departments.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add a department'),
                  content: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                        // border: OutlineInputBorder(),
                        hintText: 'Type a department name...'),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close')),
                    TextButton(
                        onPressed: () {
                          if (_textController.text.trim().isNotEmpty) {
                            setState(() {
                              departments.add(_textController.text);
                              // saveDataToStorage(employee);
                            });
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Add')),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
