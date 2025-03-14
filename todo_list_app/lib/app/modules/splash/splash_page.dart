import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/widget/todo_list_logo.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({ super.key });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

   @override
   Widget build(BuildContext context) {
       return const Scaffold(
           body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Center(child: TodoListLogo()),
             ],
           )
       );
  }
}