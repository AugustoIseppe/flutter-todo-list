import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/app/core/database/sqlit_connection_factory.dart';
import 'package:todo_list_app/app/repositories/user/user_repository.dart';
import 'package:todo_list_app/app/repositories/user/user_repository_impl.dart';
import 'package:todo_list_app/app/services/app_widget.dart';
import 'package:todo_list_app/app/services/user/user_service.dart';
import 'package:todo_list_app/app/services/user/user_service_impl.dart';

class AppModule extends StatefulWidget {
  const AppModule({super.key});

  @override
  State<AppModule> createState() => _AppModuleState();
}

class _AppModuleState extends State<AppModule> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth.instance),
        Provider(
          create: (context) => SqliteConnectionFactory(),
          lazy: false,
        ),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            firebaseAuth: context.read(),
          ),
        ),
        Provider<UserService>(
          create: (context) => UserServiceImpl(
            userRepository: context.read(),
          ),
        )
      ],
      child: const AppWidget(),
    );
  }
}
