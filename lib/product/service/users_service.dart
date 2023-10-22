import 'dart:convert';

import 'package:case_questions/product/model/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<UsersModel>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((user) => UsersModel.fromJson(user)).toList();
  } else {
    throw Exception('Kullanıcıları alırken hata oluştu.');
  }
}
