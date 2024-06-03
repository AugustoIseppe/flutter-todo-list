import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app_v2/firebase_options.dart';
import 'package:todolist_app_v2/models/auth.dart';
import 'package:todolist_app_v2/pages/home_page.dart';
import 'package:todolist_app_v2/pages/login_page.dart';
import 'package:todolist_app_v2/pages/register_page.dart';
import 'package:todolist_app_v2/pages/splash_page.dart';
import 'package:todolist_app_v2/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth(FirebaseAuth.instance),)
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
