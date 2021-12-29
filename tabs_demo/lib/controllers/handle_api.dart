import 'package:flutter/widgets.dart';
import 'package:tabs_demo/db/model/data_model.dart';
import 'package:tabs_demo/services/posts_api.dart';

ValueNotifier<List<EmployeeModel>> employeeListNotifier = ValueNotifier([]);

APIManager apiManager = APIManager();

Future<void> addEmployee(data) async {
  await apiManager.addEmployee(data).then((value) => getAllEmployee());
}

Future<void> deleteEmployee(id) async {
  await apiManager.deleteEmployee(id).then((value) => getAllEmployee());
}

Future<void> getAllEmployee() async {
  final response = await apiManager.getAllEmployee();
  employeeListNotifier.value.clear();
  for (var map in response) {
    final employee = EmployeeModel.fromMap(map);
    employeeListNotifier.value.add(employee);
    employeeListNotifier.notifyListeners();
  }
}
