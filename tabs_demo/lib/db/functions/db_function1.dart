import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tabs_demo/db/model/data_model.dart';

ValueNotifier<List<EmployeeModel>> employeeListNotifier = ValueNotifier([]);
ValueNotifier<List<DepartmentModel>> departmentListNotifier = ValueNotifier([]);

late Database _db;

// initializing database

Future<void> initializeDatabase() async {
  // var databasesPath = await getDatabasesPath();

  // await deleteDatabase('/data/user/0/com.example.tabs_demo/databases');

  // print(databasesPath);

  _db = await openDatabase(
    'TabsDemo',
    version: 1,
    onCreate: (db, version) async {
      await db
          .execute('CREATE TABLE employee (id INTEGER PRIMARY KEY, name TEXT)');
      await db.execute(
          'CREATE TABLE department (id INTEGER PRIMARY KEY, name TEXT)');
    },
  );
}

// for employee table

Future<void> addEmployee(value) async {
  await _db.rawQuery('INSERT into employee (name) values(?)', [value.name]);
  // employeeListNotifier.value.add(value);
  // employeeListNotifier.notifyListeners();
  getAllEmployee();
}

Future<void> deleteEmployee(id) async {
  await _db.rawQuery('Delete from employee where id = ?', [id]);
  getAllEmployee();
}

Future<void> getAllEmployee() async {
  final _values = await _db.rawQuery('Select * from employee');
  employeeListNotifier.value.clear();
  for (var map in _values) {
    final employee = EmployeeModel.fromMap(map);
    employeeListNotifier.value.add(employee);
    employeeListNotifier.notifyListeners();
  }
}

//  For department table

Future<void> addDepartment(value) async {
  await _db.rawQuery('INSERT into department (name) values(?)', [value.name]);
  getAllDepartment();
}

Future<void> deleteDepartment(id) async {
  await _db.rawQuery('Delete from department where id = ?', [id]);
  getAllDepartment();
}

Future<void> getAllDepartment() async {
  final _values = await _db.rawQuery('Select * from department');
  departmentListNotifier.value.clear();
  for (var map in _values) {
    final department = DepartmentModel.fromMap(map);
    departmentListNotifier.value.add(department);
    departmentListNotifier.notifyListeners();
  }
}

// Future<void> dbClose() async {
//   // final db = await instance.database;
//   await _db.close();
// }

// Future<void> deleteDatabase() async {
//   await databaseFactory.deleteDatabase(Demo);
// }
