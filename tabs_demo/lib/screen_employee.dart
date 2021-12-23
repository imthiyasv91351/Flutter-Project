import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs_demo/provider/provider_demo.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabs_demo/screen_profile.dart';

class EmployeeScreen extends StatefulWidget {
  // EmployeeScreen(this.employee);
  // EmployeeScreen({Key? key, required this.employee}) : super(key: key);
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var employee = Provider.of<ProviderDemo>(context).employee;
    // print('Building employee screen');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Employee'),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(employee[index]),
              subtitle: Text('Description $index'),
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/img/avatar.png'),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProfileScreen(name: employee[index]);
                }));
              },
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: employee.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add an employee'),
                  content: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                        // border: OutlineInputBorder(),
                        hintText: 'Type an employee name...'),
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
                            Provider.of<ProviderDemo>(context, listen: false)
                                .addEmployee(_textController.text);
                            // setState(() {
                            //   employee.add(_textController.text);

                            //   // saveDataToStorage(employee);
                            // });
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
