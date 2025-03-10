import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.grey),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: Checkbox(
            activeColor: Colors.blue,
            value: true,
            onChanged: (value) {},
          ),
          title: const Text(
            "Descrição",
            // style: TextStyle(
            //   decoration: true ? TextDecoration.lineThrough : null,
            // ),
          ),
          subtitle: const Text(
            "20/07/2024",
            // style: TextStyle(
            //   decoration: false ? TextDecoration.lineThrough : null,
            // ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 1)),
        ),
      ),
    );
  }
}
