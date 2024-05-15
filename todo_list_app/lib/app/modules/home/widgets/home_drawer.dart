import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/app/core/auth/auth_meu_provider.dart';
import 'package:todo_list_app/app/core/ui/messages.dart';
import 'package:todo_list_app/app/services/user/user_service.dart';

class HomeDrawer extends StatelessWidget {

  final nameVN = ValueNotifier<String>('');

  HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
            ),
            child: Row(
              children: [
                Selector<AuthMeuProvider, String>(selector: (context, authMeuProvider) {
                  return authMeuProvider.user?.photoURL ?? 'https://cdn.pixabay.com/photo/2023/09/16/20/48/ai-generated-8257538_1280.jpg';
                }, builder: (context, value, child) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(value),
                  );
                },),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Selector<AuthMeuProvider, String>(selector: (context, authMeuProvider) {
                      return authMeuProvider.user?.displayName ?? 'Não informado';
                    }, builder: (context, value, child) {
                      return Text(value);
                    },),
                  ),
                ),
              ],
            ),
          ),
          ListTile(title: const Text('Alterar Nome'), onTap: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text("Alterar nome"),
                content: TextField(
                  onChanged: (value) => nameVN.value = value,
                ),
                actions: [
                  TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
                  TextButton(onPressed: () async {
                    final nameValue = nameVN.value;
                    if(nameValue.isEmpty) {
                      Messages.of(context).showError('Insira um nome');
                    } else {
                      Loader.show(context);
                      await context.read<UserService>().updateDisplayName(nameValue);
                      Loader.hide();
                      Navigator.of(context).pop();
                    }
                  }, child: const Text('Alterar')),
                ],
              );
            },);
          },),
          ListTile(title: const Text('Sair'), onTap: () => context.read<AuthMeuProvider>().logout(),)
        ],
      ),
    );
  }
}
