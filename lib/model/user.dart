import 'dart:convert';

class User {
  int? id;
  String? imageUrl;
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  int? age;
  String? dob;
  int? salary;
  String? address;

  User({
    this.id,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.age,
    this.dob,
    this.salary,
    this.address,
  });

  // Factory method to create a User object from a Map
  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        imageUrl: data['imageUrl'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        email: data['email'] as String?,
        contactNumber: data['contactNumber'] as String?,
        age: data['age'] as int?,
        dob: data['dob'] as String?,
        salary: data['salary'] as int?,
        address: data['address'] as String?,
      );

  // Convert a User object to a Map
  Map<String, dynamic> toMap() => {
        'id': id,
        'imageUrl': imageUrl,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'contactNumber': contactNumber,
        'age': age,
        'dob': dob,
        'salary': salary,
        'address': address,
      };

  // Factory method to create a User object from a JSON string
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  // Convert a User object to a JSON string
  String toJson() => json.encode(toMap());
}