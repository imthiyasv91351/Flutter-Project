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
  final _userIDController = TextEditingController();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  bool _isDeleteClicked = true;
  // ignore: avoid_init_to_null
  var _deleteIndex = null;
  // bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    // var employee = Provider.of<ProviderDemo>(context).employee;
    // print('Building employee screen');
    getAllPost();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Posts'),
            Visibility(
                visible: !_isDeleteClicked,
                child: TextButton(
                  onPressed: () {
                    deletePost(_deleteIndex);
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
                    data.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                  subtitle: Text('ID: $id'),
                  // leading: const CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage: AssetImage('assets/img/avatar.png'),
                  // ),
                  trailing: TextButton(
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.purple,
                    ),
                    onPressed: () {
                      deletePost(data.id);
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
                          id: data.id,
                          title: data.title,
                          content: data.body,
                          userID: data.userId);
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
                  content: Column(
                    children: [
                      TextField(
                        controller: _userIDController,
                        decoration: const InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'Type your user ID...'),
                      ),
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'Type a title...'),
                      ),
                      TextField(
                        controller: _bodyController,
                        decoration: const InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'Type content here...'),
                      )
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close')),
                    TextButton(
                        onPressed: () {
                          onAddPost();
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

  Future<void> onAddPost() async {
    final _userID = _userIDController.text;
    final _title = _titleController.text;
    final _body = _bodyController.text;
    if (_userID.trim().isEmpty ||
        _title.trim().isEmpty ||
        _body.trim().isEmpty) {
      return;
    }

    final post =
        EmployeeModel(title: _title, body: _body, userId: int.parse(_userID));
    addPost(post);
  }

  // Future<void> getAllPosts() async {}
}
