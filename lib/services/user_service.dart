import 'package:flutter/material.dart';

import 'package:states_app/models/user.dart';

class UserService with ChangeNotifier {

  User? _user;

  User? get user => _user;
  bool get userExists => ( _user != null) ? true : false;

  set user( User? user ) {
    _user = user;
    notifyListeners();
  }


}