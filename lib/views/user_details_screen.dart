import 'package:employee_data/views/widgets/details_section.dart';
import 'package:employee_data/views/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:employee_data/model/user.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Section
            HeaderSection(user: user),
            const SizedBox(height: 24.0),

            // Details Section
            DetailsSection(user: user)
          ],
        ),
      ),
    );
  }
}
