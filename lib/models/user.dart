import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final bool isManager;

  UserModel({
    required this.email,
    this.isManager = false,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      email: data['email'] ?? '',
      isManager: data['isManager'] ?? false,
    );
  }
}
