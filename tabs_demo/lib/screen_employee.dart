import 'package:flutter/material.dart';
import 'package:tabs_demo/controllers/handle_api.dart';
import 'package:tabs_demo/db/model/data_model.dart';
// import 'package:tabs_demo/provider/provider_demo.dart';
import 'package:tabs_demo/screen_profile.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isDeleteClicked = true;
  // ignore: avoid_init_to_null
  var _deleteIndex = null;
  // bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    // var employee = Provider.of<ProviderDemo>(context).employee;
    // print('Building employee screen');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Employee'),
            Visibility(
                visible: !_isDeleteClicked,
                child: TextButton(
                  onPressed: () {
                    deleteEmployee(_deleteIndex);
                    setState(() {
                      _deleteIndex = null;
                      _isDeleteClicked = true;
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: employeeListNotifier,
        builder: (BuildContext context, List<EmployeeModel> employeeList,
            Widget? child) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = employeeList[index];
                final id = data.id;
                // print(data.id);
                return ListTile(
                  title: Text(
                    data.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                  subtitle: Text('ID: $id'),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/img/avatar.png'),
                  ),
                  trailing: TextButton(
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.purple,
                    ),
                    onPressed: () {
                      // deleteEmployee(data.id);
                    },
                  ),
                  onLongPress: () {
                    setState(() {
                      _isDeleteClicked = false;
                      // _isSelected = true;
                      _deleteIndex = data.id;
                    });
                  },
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProfileScreen(
                          id: data.id, name: data.name, email: data.email);
                    }));
                  },
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: employeeList.length);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add an employee'),
                  content: SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "Value is empty";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          decoration: const InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'Type your name...'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "Value is empty";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          controller: _emailController,
                          decoration: const InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'Type your email...'),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close')),
                    TextButton(
                        onPressed: () {
                          onAddEmployee();
                          if (_nameController.text.trim().isNotEmpty &&
                              _emailController.text.trim().isNotEmpty) {
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

  Future<void> onAddEmployee() async {
    final _name = _nameController.text;
    final _email = _emailController.text;
    if (_name.trim().isEmpty || _email.trim().isEmpty) {
      return;
    }

    // final employee = EmployeeModel(name: _name, email: _email);
    Map employee = {'name': _name, 'email': _email};
    addEmployee(employee);
  }

  // Future<void> getAllPosts() async {}
}
