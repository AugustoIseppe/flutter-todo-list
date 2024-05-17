import 'package:flutter/material.dart';
import 'package:todolist_app_v2/widgets/message_home_page.dart';
import 'package:todolist_app_v2/widgets/navigator_button.dart';
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
            const SizedBox(height: 30,),
            Column(
              children: [
                const NavigatorButton(
                  title: 'Login',
                  page: '/login_page',
                  colorTextStyle: Colors.white,
                  backgroundColorButton: Colors.black
                ),
                const SizedBox(height: 8,),
                NavigatorButton(
                  title: 'Register',
                  page: '/register_page',
                  colorTextStyle: Colors.black,
                  backgroundColorButton: Colors.grey.shade400
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
