
import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/database/sqlit_connection_factory.dart';

class SqliteAdmConnection with WidgetsBindingObserver{
  //WidgetsBindingObserver -> Observa o Flutter como um todo
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    final connection = SqliteConnectionFactory();

    switch(state){
      
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        connection.closeConnection();
        break;
    }
    super.didChangeAppLifecycleState(state);

  }
}