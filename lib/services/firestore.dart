import 'package:cloud_firestore/cloud_firestore.dart';

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
}
