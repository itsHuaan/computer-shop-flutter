import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_example/firebase_options.dart';
import 'package:login_example/pages/admin/account_management_page.dart';
import 'package:login_example/pages/admin/category_management.dart';
import 'package:login_example/pages/auth_page.dart';
import 'package:login_example/providers/login_provider.dart';
import 'package:login_example/providers/signup_provider.dart';
import 'package:login_example/services/storage_service.dart';
import 'package:login_example/theme/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StorageService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sign-in Demo',
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: ThemeMode.system,
        home: const AuthPage(),
        routes: {
          '/account_management': (context) => AccountManagementPage(),
          '/category_management': (context) => CategoryManagement(),
        },
      ),
    );
  }
}
