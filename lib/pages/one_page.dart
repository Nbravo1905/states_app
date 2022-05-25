import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/models/user.dart';

import 'package:states_app/services/user_service.dart';


class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () => userService.removeUser()
          )
        ],
      ),
      body: userService.userExists
        ? UserInformation(user: userService.user)
        : const Center(child: Text('No hay usuario')),
     floatingActionButton: FloatingActionButton(
       child: const Icon(Icons.padding),
       onPressed: () => Navigator.pushNamed(context, 'twoPage')
     ),
   );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key, required this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Genenal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ListTile( title: Text('Nombre: ${user?.name}') ),
          ListTile( title: Text('Edad: ${user?.age}') ),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ...?user?.professions?.map(
            (profession) => ListTile( title: Text(profession) )
          ).toList()
          
        ],
      ),
    );
  }
}