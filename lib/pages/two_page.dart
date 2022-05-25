import 'package:flutter/material.dart';

import 'package:states_app/models/user.dart';
import 'package:states_app/services/user_service.dart';


class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
              ? Text('Nombre: ${snapshot.data?.name}')
              : const Text('Pagina 2');
          },
        ),
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

                final newUser = User(name: 'Andres Bravo', age: 23);

                userService.loadUser(newUser);
              }
            ),

            const Divider(),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              onPressed: () {
                userService.changeAge(40);
              }
            ),

            const Divider(),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
              onPressed: () {

              }
            ),

          ],
        )
     ),
   );
  }
}