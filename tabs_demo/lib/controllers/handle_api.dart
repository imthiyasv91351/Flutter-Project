// ValueNotifier<List<DepartmentModel>> departmentListNotifier = ValueNotifier([]);
import 'package:flutter/widgets.dart';
import 'package:tabs_demo/db/model/data_model.dart';
import 'package:tabs_demo/services/posts_api.dart';

ValueNotifier<List<EmployeeModel>> employeeListNotifier = ValueNotifier([]);

APIManager apiManager = APIManager();

Future<void> addPost(data) async {
  // final response = await apiManager.getPosts();
  // await _db.rawQuery('INSERT into employee (name) values(?)', [value.name]);
  // employeeListNotifier.value.add(value);
  // employeeListNotifier.notifyListeners();
  apiManager.createPosts(data);
  // getAllPost();
}

Future<void> deletePost(id) async {
  // await _db.rawQuery('Delete from employee where id = ?', [id]);
  print(id);
  apiManager.deletePosts(id);
  // getAllPost();
}

Future<void> getAllPost() async {
  // final _values = await _db.rawQuery('Select * from employee');
  final response = await apiManager.getPosts();
  employeeListNotifier.value.clear();
  print(response);
  for (var map in response) {
    final employee = EmployeeModel.fromMap(map);
    employeeListNotifier.value.add(employee);
    employeeListNotifier.notifyListeners();
  }
}
