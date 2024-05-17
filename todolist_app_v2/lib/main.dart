import 'package:flutter/material.dart';
import 'package:todolist_app_v2/pages/home_page.dart';
import 'package:todolist_app_v2/pages/login_page.dart';
import 'package:todolist_app_v2/pages/register_page.dart';
import 'package:todolist_app_v2/pages/splash_page.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'TodoList App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      initialRoute: '/splash_page',
      routes: {
        AppRoutes.splashPage: (context) => const SplashPage(),
        AppRoutes.loginPage: (context) => const LoginPage(),
        AppRoutes.registerPage: (context) => const RegisterPage(),
        AppRoutes.homePage: (context) => const HomePage(),
      },
    );
  }
}
