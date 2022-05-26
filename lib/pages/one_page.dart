import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_cubit.dart';
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
            onPressed: () => context.read<UserCubit>().deleteState(), 
            icon: const Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: const BodyScaffold(),
     floatingActionButton: FloatingActionButton(
       child: const Icon(Icons.padding),
       onPressed: () => Navigator.pushNamed(context, 'twoPage')
     ),
   );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {

        switch (state.runtimeType) {
          case UserInitial:
            return const Center(child: Text('No hay usuario aun :c'));
          case UserActive:
            return UserInformation(user: (state as UserActive).user );
          default:
            return const Center(child: Text('Cargando'));
        }
        
        /*if(state is UserInitial) {
          return const Center(child: Text('No hay usuario aun :c'));
        }else if( state is UserActive) {
          return UserInformation(user: state.user);
        }else {
          return const Center(child: Text('Cargando'));
        }*/
        
      });
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
            (profession) => ListTile( title: Text(profession) )
          ).toList()

        ],
      ),
    );
  }
}