import 'package:employee_data/model/user.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final User user;
  const HeaderSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User Image
        ClipOval(
          child: Image.network(
            user.imageUrl ?? 'https://via.placeholder.com/150',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.person, size: 120, color: Colors.grey);
            },
          ),
        ),
        const SizedBox(height: 16.0),

        // User Name
        Text(
          "${user.firstName} ${user.lastName}",
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),

        // User Email
        Text(
          user.email ?? 'No email',
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}