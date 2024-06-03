import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app_v2/models/auth.dart';

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
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (auth.userPhotoUrl != null)
              CircleAvatar(
                backgroundImage: NetworkImage(auth.userPhotoUrl!),
              ),
            if (auth.userName != null)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListTile(
                  title: Text(auth.userName!, style: TextStyle(color: Colors.white),),
                  subtitle: Text(auth.userEmail!, style: TextStyle(color: Colors.white),),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
