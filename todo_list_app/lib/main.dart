import 'package:flutter/material.dart';
import 'package:todo_list_app/app/services/app_module.dart';
import 'package:todo_list_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(const AppModule());
}

