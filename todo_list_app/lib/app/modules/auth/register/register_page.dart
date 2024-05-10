import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/widget/todo_list_field.dart';
import 'package:todo_list_app/app/core/widget/todo_list_logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ],
        ),
        // centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: ClipOval(
              child: Container(
                color: Colors.white,
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 17,
                    color: Colors.black,
                  ),
                )),
              ),
            )),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * .3,
            child: const FittedBox(
              fit: BoxFit.fitHeight,
              child: TodoListLogo(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TodoListField(label: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                TodoListField(
                  label: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TodoListField(
                  label: 'Confirmar Senha',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
