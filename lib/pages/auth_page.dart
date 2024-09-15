import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_example/pages/admin_page.dart';
import 'package:login_example/pages/home_page.dart';
import 'package:login_example/pages/login_page.dart';
import 'package:login_example/services/firestore.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const LoginPage();
          }

          User user = snapshot.data!;
          return FutureBuilder<bool>(
            future: firestoreService.isManager(user.email!),
            builder: (context, roleSnapshot) {
              if (roleSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (roleSnapshot.hasError) {
                return const Center(child: Text('Error loading role'));
              }
              bool isManager = roleSnapshot.data ?? false;
              if (isManager) {
                return const AdminPage();
              } else {
                return const HomePage();
              }
            },
          );
        },
      ),
    );
  }
}
