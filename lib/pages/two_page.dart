import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/models/user.dart';
import 'package:states_app/services/user_service.dart';


class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.userExists
          ? Text('${userService.user?.name}')
          : const Text('Pagina 2'),
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
                
                final newUser = User(
                  name: 'Nino Andres Bravo',
                  age: 23,
                  professions: ['FullStack Developer', 'Game']
                );

                userService.user = newUser;

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
                userService.addProfession();
              }
            ),

          ],
        )
     ),
   );
  }
}