import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserRepository {
  final String baseUrl;

  UserRepository(this.baseUrl);

  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(seconds: 4));

    return [
      User(id: 1, name: "name1", email: "email1"),
      User(id: 2, name: "name2", email: "email2"),
      User(id: 3, name: "name3", email: "email3"),
      User(id: 4, name: "name4", email: "email5"),
      User(id: 5, name: "name5", email: "email5"),
    ];
    // final response = await http.get(Uri.parse('$baseUrl/users'));
    // if (response.statusCode == 200) {
    //   return User.fromJsonList(response.body);
    // } else {
    //   throw Exception('Failed to load users');
    // }
  }
}
