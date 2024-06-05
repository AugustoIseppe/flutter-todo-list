import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app_v2/models/auth.dart';
import 'package:todolist_app_v2/pages/create_task.dart';
import 'package:todolist_app_v2/widgets/home_filters.dart';
import 'package:todolist_app_v2/widgets/home_header.dart';
import 'package:todolist_app_v2/widgets/home_tasks.dart';
import 'package:todolist_app_v2/widgets/home_week_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          if (auth.userPhotoUrl != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(auth.userPhotoUrl!),
              ),
            )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const IntrinsicHeight(
                  child: Column(
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeekFilter(),
                      HomeTasks(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 800),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.decelerate);
                return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.bottomRight,
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return const CreateTask();
              },
            ),
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}



// Container(
//         color: Colors.red,
//         width: MediaQuery.of(context).size.width,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (auth.userPhotoUrl != null)
//               CircleAvatar(
//                 backgroundImage: NetworkImage(auth.userPhotoUrl!),
//               ),
//             if (auth.userName != null)
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: ListTile(
//                   title: Text(auth.userName!, style: TextStyle(color: Colors.white),),
//                   subtitle: Text(auth.userEmail!, style: TextStyle(color: Colors.white),),
//                 ),
//               ),
//           ],
//         ),
//       ),