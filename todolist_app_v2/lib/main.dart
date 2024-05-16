import 'package:flutter/material.dart';
import 'package:todolist_app_v2/pages/home_page.dart';
import 'package:todolist_app_v2/pages/login_page.dart';
import 'package:todolist_app_v2/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      initialRoute: '/login_page',
      routes: {
        AppRoutes.loginPage: (context) => const LoginPage(),
        AppRoutes.homePage: (context) => const HomePage(),
      },
    );
  }
}
