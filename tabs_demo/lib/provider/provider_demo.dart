import 'package:flutter/material.dart';

class ProviderDemo with ChangeNotifier {
  String test = 'I am a provider';
  var employee = [];
  var department = [];

  void changeValue(change) {
    test = change;
    notifyListeners();
  }

  void addEmployee(value) {
    employee.add(value);
    notifyListeners();
  }

  void addDepartment(value) {
    department.add(value);
    notifyListeners();
  }

  Widget widget() {
    return Container(
      height: 100,
      width: 100,
      decoration:
          const BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
    );
  }
}
