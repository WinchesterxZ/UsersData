import 'package:flutter/material.dart';
import 'package:employee_data/model/user.dart';
import 'package:employee_data/services/user_service.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<User>> _users;

  @override
  void initState() {
    super.initState();
    _users = _fetchUsers();
  }

  Future<List<User>> _fetchUsers() async {
    final userService = UserService();
    return await userService.getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Employee List')),
      ),
      body: FutureBuilder<List<User>>(
        future: _users,
        builder: (context, snapshot) {
          // Check if data is loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Check if there's an error
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // Check if data is available
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No employees found.'));
          }

          // Display the list of users
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text(user.email ?? 'No email'),
                leading: ClipOval(
                  child: Image.network(
                    user.imageUrl ?? 'https://via.placeholder.com/150',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    // Show a loading indicator while the image is loading
                    loadingBuilder: (context, child, loadingProgress){
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                    // Handle image loading errors
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.person, size: 50);
                    },
                  ),
                ),
                trailing: Text("\$${user.salary ?? 'N/A'}"),
              );
            },
          );
        },
      ),
    );
  }
}