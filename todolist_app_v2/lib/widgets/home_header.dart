import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app_v2/models/auth.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, auth, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Bem vindo, \n${auth.userName}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
