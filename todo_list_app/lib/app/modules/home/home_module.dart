import 'package:todo_list_app/app/core/modules/todo_list_module.dart';
import 'package:todo_list_app/app/modules/home/home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(routers: {
          '/home': (context) => const HomePage(),
        });
}
