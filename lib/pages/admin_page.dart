import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_example/components/my_app_bar.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> firebaseAuthErrorCodes = [
      'invalid-email',
      'wrong-password',
      'user-not-found',
      'user-disabled',
      'too-many-requests',
      'operation-not-allowed',
      'email-already-in-use',
      'weak-password',
      'network-request-failed',
      'credential-already-in-use',
      'requires-recent-login',
    ];
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: MyAppBar(
        title: 'Admin Page',
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is Admin Page\nUser: ${user.email}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_reaction_rounded),
        onPressed: () {
        },
      ),
    );
  }
}
