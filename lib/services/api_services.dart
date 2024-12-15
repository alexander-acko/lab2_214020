import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const sajtURL = "https://official-joke-api.appspot.com";

  Future<List<String>> fetchJokeTypes() async {
    final response = await http.get(Uri.parse('$sajtURL/types'));
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Упссс....се случи грешка при вчитувањето на типовите шеги!');
    }
  }

  Future<List<Map<String, dynamic>>> fetchJokesByType(String type) async {
    final response = await http.get(Uri.parse('$sajtURL/jokes/$type/ten'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Неуспеав да ги вчитам шегите од типот $type');
    }
  }

  Future<Map<String, dynamic>> fetchRandomJoke() async {
    final response = await http.get(Uri.parse('$sajtURL/random_joke'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Ох не! Неможам да вчитам рандом шега!');
    }
  }
}