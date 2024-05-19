import 'package:flutter/material.dart';
import 'package:todolist_app_v2/widgets/message_home_page.dart';
import 'package:todolist_app_v2/widgets/todo_list_logo_v2.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // height: MediaQuery.of(context).size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TodoListLogoV2(),
            const MessageHomePage(),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                TextButton(
                  child: const Text('Login', style: TextStyle(color: Colors.white),),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: Size(300, 50)
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login_page');
                  },
                ),
                const SizedBox(
                  height: 4,
                ),
                 TextButton(
                  child: const Text('Registrar', style: TextStyle(color: Colors.black),),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    fixedSize: Size(300, 50)
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register_page');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
