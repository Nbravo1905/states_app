import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/models/user.dart';


class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

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
                final newUser = User(name: 'Nino Andres Bravo', age: 23, professions: ['Flutter', 'React Native']);

                userBloc.add(ActivateUserEvent(newUser));
              }
            ),

            const Divider(),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              onPressed: () {
                userBloc.add(ChangeUserAgeEvent(30));
              }
            ),

            const Divider(),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
              onPressed: () {
                final newProfe = [
                  'Nueva 1',
                  'Nueva 2',
                  'Nueva 3',
                  'Nueva 4',
                ];

                userBloc.add(AddProfessionEvent(newProfe));
              }
            ),

          ],
        )
     ),
   );
  }
}