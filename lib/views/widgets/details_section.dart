 import 'package:employee_data/model/user.dart';
import 'package:employee_data/views/widgets/details_row.dart';
import 'package:flutter/material.dart';

class DetailsSection extends StatelessWidget {
  final User user;
  const DetailsSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
     return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Contact Number
            DetailsRow(
                icon: Icons.phone,
                label: 'Contact Number',
                value: user.contactNumber ?? 'N/A'),
            const Divider(height: 24.0),

            // Age
            DetailsRow(
                icon: Icons.calendar_today,
                label: 'Age',
                value: user.age?.toString() ?? 'N/A'),
            const Divider(height: 24.0),

            // Date of Birth
            DetailsRow(
                icon: Icons.cake,
                label: 'Date of Birth',
                value: user.dob ?? 'N/A'),
            const Divider(height: 24.0),

            // Salary
            DetailsRow(
                icon: Icons.monetization_on,
                label: 'Salary',
                value: '\$${user.salary?.toString() ?? 'N/A'}'),
            const Divider(height: 24.0),

            // Address
            DetailsRow(
                icon: Icons.location_on,
                label: 'Address',
                value: user.address ?? 'N/A'),
          ],
        ),
      ),
    );
  }
}
