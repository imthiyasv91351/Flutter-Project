import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:tabs_demo/db/functions/db_function1.dart';
import 'package:tabs_demo/db/model/data_model.dart';
// import 'package:tabs_demo/provider/provider_demo.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  final _textController = TextEditingController();
  // ignore: avoid_init_to_null
  var _deleteIndex = null;
  bool _isDeleteClicked = true;

  @override
  Widget build(BuildContext context) {
    // var departments = Provider.of<ProviderDemo>(context).department;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Department'),
            Visibility(
                visible: !_isDeleteClicked,
                child: TextButton(
                    onPressed: () {
                      deleteDepartment(_deleteIndex);
                      setState(() {
                        _deleteIndex = null;
                        _isDeleteClicked = true;
                      });
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    )))
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: departmentListNotifier,
        builder: (BuildContext context, List<DepartmentModel> departmentList,
            Widget? child) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = departmentList[index];
                // print(data.id);
                return ListTile(
                  title: Text(
                    data.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.purple),
                  ),
                  // subtitle: Text('Message $index'),
                  // leading: const CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage: AssetImage('assets/img/avatar.png'),
                  // ),
                  // trailing: Text('1$index:05 PM'),
                  onLongPress: () {
                    setState(() {
                      _isDeleteClicked = false;
                      _deleteIndex = data.id;
                    });
                  },
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider(
                  height: 30,
                );
              },
              itemCount: departmentList.length);
        },
      ),
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
                          onAddDepartment();
                          Navigator.of(context).pop();
                          // if (_textController.text.trim().isNotEmpty) {
                          //   setState(() {
                          //     departments.add(_textController.text);
                          //     // saveDataToStorage(employee);
                          //   });
                          //   Navigator.of(context).pop();
                          // }
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

  Future<void> onAddDepartment() async {
    final _deapartmentName = _textController.text;
    if (_deapartmentName.trim().isEmpty) {
      return;
    }

    final department = DepartmentModel(name: _deapartmentName);
    addDepartment(department);
  }
}
