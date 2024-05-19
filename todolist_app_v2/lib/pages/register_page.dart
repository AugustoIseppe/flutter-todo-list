import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todolist_app_v2/models/auth.dart';
import 'package:todolist_app_v2/widgets/form_login.dart';
import 'package:todolist_app_v2/widgets/todo_list_logo_v2.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailRegisterController = TextEditingController();
  final _passwordRegisterController = TextEditingController();
  final _confirmPasswordRegisterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 2.0),
              child: Icon(
                Ionicons.return_up_back_outline,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TodoListLogoV2(),
              const SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormLogin(
                        controller: _emailRegisterController,
                        labelText: 'Insira um e-mail',
                        validator: Validatorless.multiple([
                          Validatorless.required('E-mail obrigatório'),
                          Validatorless.email('E-mail inválido')
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormLogin(
                        controller: _passwordRegisterController,
                        labelText: 'Informe sua senha',
                        validator: Validatorless.multiple(
                          [
                            Validatorless.required('Senha obrigatória'),
                            Validatorless.min(
                                6, 'A senha deve ter no mínimo 6 caracteres')
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormLogin(
                        controller: _confirmPasswordRegisterController,
                        labelText: 'Cofirmar senha',
                        validator: Validatorless.multiple(
                          [
                            Validatorless.required('Senha obrigatória'),
                            Validatorless.min(
                                6, 'A senha deve ter no mínimo 6 caracteres')
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                       TextButton(
                        style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(300, 50)
                  ),
                    child: const Text('Cadastrar', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      final formIsValid = _formKey.currentState?.validate() ?? false;
                      if (formIsValid) {
                        final auth = Auth();
                        auth.createUserWithEmailAndPassword(_emailRegisterController.text, _passwordRegisterController.text);
                      }
                    },
                  ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
