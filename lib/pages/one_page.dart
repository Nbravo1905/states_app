import 'package:flutter/material.dart';


class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
      ),
      body: const UserInformation(),
     floatingActionButton: FloatingActionButton(
       child: const Icon(Icons.padding),
       onPressed: () => Navigator.pushNamed(context, 'twoPage')
     ),
   );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Genenal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ListTile( title: Text('Nombre: ') ),
          ListTile( title: Text('Edad: ') ),

          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ListTile( title: Text('Profesion 1: ') ),
          ListTile( title: Text('Profesion 2: ') ),
          ListTile( title: Text('Profesion 3: ') ),
        ],
      ),
    );
  }
}