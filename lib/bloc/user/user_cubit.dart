import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  UserCubit() : super( UserInitial() );

  void addUser( User user ) {
    emit(UserActive(user));
  }

  void changeAge( int age ){

    final currentState = state;

    if( currentState is UserActive) {
      final newUser = currentState.user.copyWith(age: age);
      //currentState.user.age = age;
      emit(UserActive( newUser ));

    }

  }


  void addProfession( ){
    final currentState = state;
    if( currentState is UserActive) {
      final newPro = [
        ...?currentState.user.professions,
        'Nueva Rama',
        'Todo pro'
      ];
      final newUser = currentState.user.copyWith(professions: newPro);
      emit(UserActive( newUser ));

    }
    
  }


  void deleteState(){
    emit(UserInitial());
  }


}