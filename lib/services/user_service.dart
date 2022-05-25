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

  void changeAge(int age) {
    _user?.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession() {
    _user?.professions?.add('Profesion ${_user!.professions!.length + 1}');
    notifyListeners();

  }


}