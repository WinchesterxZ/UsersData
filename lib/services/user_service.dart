import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:employee_data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<List<User>> getEmployees() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('userData');
      if (cachedData != null) {
        final List<dynamic> jsonData = jsonDecode(cachedData);
        final List<User> users = _mapData(jsonData);
        return users;
      } else {
        final dio = Dio();
        final response =
            await dio.get('https://dummyjson.com/c/cef4-0b51-43f1-92e9');
        // Check if the request was successful
        if (response.statusCode == 200) {
          // Save the data to cache
          await prefs.setString('userData', jsonEncode(response.data));
          // return the users
          return _mapData(response.data);
        } else {
          // Handle errors
          throw Exception(
              'Failed to load users. Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      // Handle exceptions
      throw Exception('An error occurred: $e');
    }
  }

  List<User> _mapData(List<dynamic> jsonData) {
    final List<User> users =
        jsonData.map<User>((data) => User.fromMap(data)).toList();
    return users;
  }
}
