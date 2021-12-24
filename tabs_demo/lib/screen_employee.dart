import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:tabs_demo/db/functions/db_function1.dart';
import 'package:tabs_demo/db/model/data_model.dart';
// import 'package:tabs_demo/provider/provider_demo.dart';
import 'package:tabs_demo/screen_profile.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final _textController = TextEditingController();
  bool _isDeleteClicked = true;
  // ignore: avoid_init_to_null
  var _deleteIndex = null;
  // bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    // var employee = Provider.of<ProviderDemo>(context).employee;
    // print('Building employee screen');
    // getAllEmployee();
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
                  // tileColor: (_isSelected) ? (Colors.black12) : (null),
                  // selectedTileColor: (_isSelected) ? (Colors.black12) : (null),
                  title: Text(data.name),
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
                      return ProfileScreen(id: data.id, name: data.name);
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
                          onAddEmployee();
                          Navigator.of(context).pop();
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
    final _name = _textController.text;
    if (_name.trim().isEmpty) {
      return;
    }

    final employee = EmployeeModel(name: _name);
    addEmployee(employee);
  }
}
