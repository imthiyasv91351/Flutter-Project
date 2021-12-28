import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tabs_demo/constants/strings.dart';

class APIManager {
  Future<List> getPosts() async {
    // var client = http.Client();
    // var url = Uri.
    final response = await http.get(Uri.parse(Strings.posts));
    return jsonDecode(response.body);
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
  }

  Future<void> createPosts(data) async {
    await http.post(Uri.parse(Strings.posts), body: jsonEncode(data), headers: {
      'Content-type': 'application/json; charset=UTF-8',
    });
    // return jsonDecode(response.body);
  }

  Future<void> deletePosts(id) async {
    await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    );
    // return jsonDecode(response.body);
  }
}
