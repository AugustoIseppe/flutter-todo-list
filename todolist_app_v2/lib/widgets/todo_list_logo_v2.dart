import 'dart:math';

import 'package:flutter/material.dart';

class TodoListLogoV2 extends StatelessWidget {
  const TodoListLogoV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
        transform: Matrix4.rotationZ(-8 * pi / 90)..translate(-25.0),
        child: Image.asset(
                'assets/images/logo_todo_list.png',
                fit: BoxFit.cover,
                width: 300,
              ),
      ),
    );
  }
}
