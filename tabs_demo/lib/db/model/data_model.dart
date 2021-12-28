class EmployeeModel {
  int? id;
  final String title;
  final String body;
  int userId;

  EmployeeModel(
      {required this.title, required this.body, required this.userId, this.id});

  static EmployeeModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final title = map['title'] as String;
    final body = map['body'] as String;
    final userId = map['userId'] as int;

    return EmployeeModel(id: id, title: title, body: body, userId: userId);
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
