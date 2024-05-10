import 'package:flutter/material.dart';

class TodoListLogo extends StatelessWidget {
  const TodoListLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo_todo_list.png',
          fit: BoxFit.cover,
          width: 100,
        ),
        const Text(
          "Lista de Tarefas",
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
