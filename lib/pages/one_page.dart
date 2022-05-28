import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/models/user.dart';


class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false)
                .add(DeleteStateEvent());
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.userExists
            ? UserInformation(user: state.user! )
            : const Center(child: Text('No hay usuario'));
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

  final User user;

  const UserInformation({
    Key? key, required this.user,
  }) : super(key: key);

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

          ListTile( title: Text('Nombre: ${user.name}') ),
          ListTile( title: Text('Edad: ${user.age}') ),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ...?user.professions?.map( 
            (prof) => ListTile( title: Text(prof) )
          ).toList()
        ],
      ),
    );
  }
}