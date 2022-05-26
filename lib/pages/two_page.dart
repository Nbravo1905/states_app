import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_cubit.dart';
import 'package:states_app/models/user.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final userCubit = context.read<UserCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: const Text('Establercer Usuario', style: TextStyle(color: Colors.white)),
              onPressed: () {
                //final bloc = BlocProvider.of<UserCubit>(context, listen: false);
                final newUser = User(
                  name: 'Nino Andres', 
                  age: 25,
                  professions: ['Developer Mobile', 'Flutter']
                );
                //bloc.addUser(newUser);

                userCubit.addUser(newUser);
              }
            ),

            const Divider(),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              onPressed: () {
                userCubit.changeAge(30);
              }
            ),

            const Divider(),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
              onPressed: () {
                userCubit.addProfession();
              }
            ),

          ],
        )
     ),
   );
  }
}