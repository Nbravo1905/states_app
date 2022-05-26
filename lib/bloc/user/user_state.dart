part of 'user_cubit.dart';

@immutable
abstract class UserState {

}

class UserInitial extends UserState {

  final userExists = false;

}


class UserActive extends UserState {
  final userExists = true;
  final User user;

  UserActive(this.user);

}

