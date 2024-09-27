import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String name;
  final String description;
  final String imageUrl;
  final Timestamp timestamp;

  const CategoryModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.timestamp,
  });

  factory CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CategoryModel(
      name: data['name'] ?? '',
      description: data['description'] ?? false,
      imageUrl: data['imageUrl'] ?? '',
      timestamp: data['timestamp'] ?? '',
    );
  }
}
