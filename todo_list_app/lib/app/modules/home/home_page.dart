import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/app/core/auth/auth_meu_provider.dart';
import 'package:todo_list_app/app/modules/home/widgets/home_drawer.dart';

class HomePage extends StatelessWidget {

  const HomePage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('HomePage'), centerTitle: true,),
           drawer: HomeDrawer(),
           body: Container(),
       );
  }
}