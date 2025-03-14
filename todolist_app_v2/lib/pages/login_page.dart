import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app_v2/models/auth.dart';
import 'package:todolist_app_v2/utils/app_routes.dart';
import 'package:todolist_app_v2/widgets/form_login.dart';
import 'package:todolist_app_v2/widgets/loading_page.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0, top: 100),
              child: Column(
                children: [
                  Text(
                    'Lets Sign you in. ',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        letterSpacing: .5,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                    'Welcome Back. ',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        letterSpacing: .5,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'Youve been missed. ',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        letterSpacing: .5,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Formulario(
                      controller: _emailController,
                      labelText: 'E-mail',
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required('E-mail obrigatório'),
                          Validatorless.email('E-mail inválido')
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Formulario(
                      controller: _passwordController,
                      labelText: 'Senha',
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required('Senha obrigatória'),
                          Validatorless.min(
                              6, 'A senha deve ter no mínimo 6 caracteres')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 160, height: 0.1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'ou',
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                  ),
                ),
                Container(width: 160, height: 0.2, color: Colors.black),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              height: 60,
              child: SignInButton(
                Buttons.Google,
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  try {
                    final auth = Provider.of<Auth>(context, listen: false);
                    await auth.googleLogin();
                    if (context.mounted) {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.homePage);
                    }
                    // Navigator.of(context)
                    // .pushReplacementNamed(AppRoutes.homePage);
                  } catch (error) {
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Erro ao realizar login"),
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

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(
                    //         "Erro ao realizar login: ${e.toString()}"),
                    //   ),
                    // );
                  }
                  setState(() {
                    _isLoading = false;
                  });
                },
                text: 'Continuar com Google',
                padding: const EdgeInsets.all(10),
                elevation: 5,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
              ),
            ),
            // if (_isLoading) const LoadingPage(),
            const SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Não tem uma conta?',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/register_page');
                        },
                        child: Text(
                          'Cadastre-se!',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: const Size(300, 50)),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      final formIsValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formIsValid) {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        final auth = Provider.of<Auth>(context, listen: false);
                        try {
                          final success = await auth.signInWithEmailAndPassword(
                              email, password);

                          if (success && mounted) {
                            // Navegar para a próxima página após login bem-sucedido
                            if (context.mounted) {
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoutes.homePage);
                            }
                          }
                        } catch (error) {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Erro ao realizar login"),
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

                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     content: Text(
                          //         "Erro ao realizar login: ${e.toString()}"),
                          //   ),
                          // );
                        }
                      }
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  if (_isLoading) const LoadingPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
