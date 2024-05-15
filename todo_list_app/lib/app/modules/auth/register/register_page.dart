import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/app/core/notifier/default_listener_notifier.dart';
import 'package:todo_list_app/app/core/validators/validators.dart';
import 'package:todo_list_app/app/core/widget/todo_list_field.dart';
import 'package:todo_list_app/app/core/widget/todo_list_logo.dart';
import 'package:validatorless/validatorless.dart';
import 'package:todo_list_app/app/modules/auth/register/register_controller.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<RegisterController>().removeListener(() {});
  }

  @override
  void initState() {
    super.initState();
    final defaultListener = DefaultListenerNotifier(changeNotifier: context.read<RegisterController>());
    defaultListener.listener(context: context, successCallback: (notifier, listenerInstance) {
      listenerInstance.dispose();
      Navigator.of(context).pushNamed('/login');
    },);
    // context.read<RegisterController>().addListener(() {
    //   final controller = context.read<RegisterController>();
    //   var success = controller.success;
    //   var error = controller.error;
    //   if (success) {
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
    //   } else if (error != null && error.isNotEmpty) {
        
    //   }
    // });
  }

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
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TodoListField(
                      label: 'Email',
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido'),
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TodoListField(
                      label: 'Senha',
                      obscureText: true,
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha obrigatória'),
                        Validatorless.min(
                            6, 'A senha deve ter no minimo 6 caracteres'),
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TodoListField(
                      label: 'Confirmar Senha',
                      obscureText: true,
                      controller: _confirmPasswordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha obrigatória'),
                        Validators.compare(
                            _passwordEC, 'As senhas são incompatíveis')
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          final email = _emailEC.text;
                          final password = _passwordEC.text;
                          if (formValid) {
                            context
                                .read<RegisterController>()
                                .registerUser(email, password);
                          }
                        },
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
