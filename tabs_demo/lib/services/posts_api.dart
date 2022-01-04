import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tabs_demo/constants/strings.dart';

class APIManager {
  Future<List> getAllEmployee() async {
    // var client = http.Client();
    // var url = Uri.
    final response = await http.get(Uri.parse(Strings.employeeURL));
    return jsonDecode(response.body);
  }

  Future<void> addEmployee(data) async {
    await http
        .post(Uri.parse(Strings.employeeURL), body: jsonEncode(data), headers: {
      'Content-type': 'application/json; charset=UTF-8',
    });
    // return jsonDecode(response.body);
  }

  Future<void> deleteEmployee(id) async {
    await http.delete(
      Uri.parse('http://10.0.2.2:5000/api/v1/employee/?id=$id'),
    );
    // return jsonDecode(response.body);
  }

  //department

  Future<List> getAllDepartment() async {
    // var client = http.Client();
    // var url = Uri.s
    final response = await http.get(Uri.parse(Strings.departmentURL));
    return jsonDecode(response.body);
  }

  Future<void> addDepartment(data) async {
    await http.post(Uri.parse(Strings.departmentURL),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        });
    // return jsonDecode(response.body);
  }

  Future<void> deleteDepartment(id) async {
    await http.delete(
      Uri.parse('http://10.0.2.2:5000/api/v1/department/?id=$id'),
    );
    // return jsonDecode(response.body);
  }
}










// try {
    //   final response = await http.get(Uri.parse(Strings.posts));
    //   if (response.statusCode == 200) {
    //     print(response.body);
    //     return jsonDecode(response.body);
    //   } else {
    //     //server error
    //     return Future.error('Server error');
    //   }
    // } catch (SocketException) {
    //   //fetching errors
    //   return Future.error('Error fetching data');
    // }
    // Await the http get response, then decode the json-formatted response.
    // var response = await http.get(url);
    // final response = await http.get(Uri.parse(Strings.posts));
    // return jsonDecode(response.body);