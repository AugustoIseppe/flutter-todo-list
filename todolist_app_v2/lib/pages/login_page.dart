import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todolist_app_v2/widgets/form_login.dart';
import 'package:todolist_app_v2/widgets/navigator_button.dart';
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
      body: Column(
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
                      fontSize: 20,
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
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  'Youve been missed. ',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.blue,
                      letterSpacing: .5,
                      fontSize: 15,
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
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  FormLogin(
                    controller: _emailController,
                    labelText: 'Nome de Usuário ou E-mail',
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido')
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormLogin(
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
            width: 300,
            child: SignInButton(
              Buttons.Google,
              onPressed: () {},
              text: 'Continue com o Google..',
              padding: const EdgeInsets.all(10),
              elevation: 5,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
            ),
          ),
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
                  children: [
                    Text(
                      'Não tem uma conta?',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.blue,
                          letterSpacing: .5,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Cadastre-se!',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                      height: 3,
                    ),
                const NavigatorButton(
                    title: 'Login',
                    page: '/home_page',
                    colorTextStyle: Colors.white,
                    backgroundColorButton: Colors.black)
              ],
            ),
          )
        ],
      ),
    );
  }
}
