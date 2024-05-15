
import 'package:flutter/material.dart';

class TodoListNavigator {
  TodoListNavigator._(); // construtor privado

  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState? get to => navigatorKey.currentState; 
}