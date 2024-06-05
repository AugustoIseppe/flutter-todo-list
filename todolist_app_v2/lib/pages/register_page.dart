import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
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

  // Future<void> teste() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   final provider = Provider.of<Auth>(context, listen: false);
  //   // final userToken = await provider.;
  //    print("TOKEN RETORNADO DA REGISTERPAGE: ${userToken}");
  // }

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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Formulario(
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
                      Formulario(
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
                      Formulario(
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
                        height: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: const Size(300, 50)),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          final formIsValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formIsValid) {
                            try {
                              final auth =
                                  Provider.of<Auth>(context, listen: false);
                              auth.signUpWithEmailPassword(
                                  _emailRegisterController.text,
                                  _passwordRegisterController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Cadastro realizado com sucesso"),
                                ),
                              );
                            } catch (error) {
                              if (context.mounted) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          const Text("Erro ao realizar login"),
                                      content: Text(error.toString()),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
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
