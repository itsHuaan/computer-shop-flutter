import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:login_example/models/category.dart';
import 'package:login_example/models/user.dart';

class FirestoreService {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  final CollectionReference categories = FirebaseFirestore.instance.collection('categories');

  Future<bool> isManager(String email) async {
    QuerySnapshot querySnapshot = await users.where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
      return userData['isManager'] as bool;
    }
    return false;
  }

  Future<void> addUser(UserModel user) async {
    try {
      await users.add(
        {
          'email': user.email,
          'isManager': user.isManager,
          'timestamp': Timestamp.now(),
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Stream<QuerySnapshot> getUsers() {
    return users.orderBy('isManager', descending: true).snapshots();
  }

  Future<void> deleteUser(String email) async {
    QuerySnapshot snapshot = await users.where('email', isEqualTo: email).get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> addCatgory(CategoryModel category) async {
    try {
      await categories.add({
        'name': category.name,
        'description': category.description,
        'imageUrl': category.imageUrl,
        'timestamp': category.timestamp,
      });
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
