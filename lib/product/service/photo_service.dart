import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> fetchUserImage(int userId) async {
  final response =
      await http.get(Uri.parse('https://picsum.photos/id/$userId/info'));
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data['download_url'];
  } else {
    throw Exception('Kullanıcı resmini alırken hata oluştu.');
  }
}
