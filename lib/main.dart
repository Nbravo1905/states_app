import 'package:flutter/material.dart';

import 'package:states_app/pages/one_page.dart';
import 'package:states_app/pages/two_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'onePage',
      routes: {
        'onePage': (_) => const OnePage(),
        'twoPage': (_) => const TwoPage(),
      },
    );
  }
}