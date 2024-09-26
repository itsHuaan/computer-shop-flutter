import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_example/components/my_circular_progress_indicator.dart';
import 'package:login_example/pages/admin/dashboard_page.dart';
import 'package:login_example/pages/home_page.dart';
import 'package:login_example/pages/login_or_register_page.dart';
import 'package:login_example/services/firestore_service.dart';

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
            return const Center(
                child: MyCircularProgressIndicator(
              strokeWidth: 5.0,
            ));
          }

          if (!snapshot.hasData) {
            return const LoginOrRegisterPage();
          }

          User user = snapshot.data!;
          return FutureBuilder<bool>(
            future: firestoreService.isManager(user.email!),
            builder: (context, roleSnapshot) {
              if (roleSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: MyCircularProgressIndicator(
                  strokeWidth: 5.0,
                ));
              }
              if (roleSnapshot.hasError) {
                return const Center(child: Text('Error loading role'));
              }
              bool isManager = roleSnapshot.data ?? false;
              if (isManager) {
                return const DashboardPage();
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
