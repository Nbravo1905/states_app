import 'dart:async';

import 'package:states_app/models/user.dart';

class _UserService {

  User? _user;

  final StreamController<User> _userStreamController = StreamController<User>.broadcast();

  Stream<User> get userStream => _userStreamController.stream;

  User? get user => _user;
  bool get userExists => ( _user != null) ? true : false;

  void loadUser( User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void changeAge( int age) {
    _user?.age = age;
    _userStreamController.add( _user! );

  }

  clearStream(){
    _userStreamController.close();
  }


}


final userService = _UserService();
