import 'package:flutter/material.dart';

import 'package:states_app/services/user_service.dart';
import 'package:states_app/models/user.dart';
class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          
          return snapshot.hasData
            ? UserInformation(user: snapshot.data,)
            : const Center(child: Text('No hay información del usuario'));

        },
      ),
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
          ListTile( title: Text('Edad:   ${user?.age}') ),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          const ListTile( title: Text('Profesion 1: ') ),
          const ListTile( title: Text('Profesion 2: ') ),
          const ListTile( title: Text('Profesion 3: ') ),
        ],
      ),
    );
  }
}