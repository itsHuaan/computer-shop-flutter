import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_example/models/user_model.dart';

class FirestoreService {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

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
}
