class EmployeeModel {
  int? id;
  final String name;
  final String email;

  EmployeeModel({required this.name, required this.email, this.id});

  static EmployeeModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final email = map['email'] as String;

    return EmployeeModel(id: id, name: name, email: email);
  }
}

class DepartmentModel {
  int? id;
  final String name;

  DepartmentModel({required this.name, this.id});

  static DepartmentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;

    return DepartmentModel(id: id, name: name);
  }
}
