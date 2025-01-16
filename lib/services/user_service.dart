import 'dart:convert';
import 'package:employee_data/model/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  final url = Uri.parse('https://dummyjson.com/c/cef4-0b51-43f1-92e9');

  Future<List<User>> getEmployees() async {
    try {
      final response = await http.get(url);

      // Print the status code and response body for debugging
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Decode the JSON response into a List
        final List<dynamic> jsonData = jsonDecode(response.body);

        // Map each JSON object to a User object using User.fromMap
        final List<User> users = jsonData
            .map<User>((data) => User.fromMap(data))
            .toList();

        return users;
      } else {
        // Handle errors
        throw Exception('Failed to load users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      throw Exception('An error occurred: $e');
    }
  }
}