// lib/models/user.dart
class User {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? role; // 'usuario', 'rescatista', 'veterinaria'

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
    );
  }
}