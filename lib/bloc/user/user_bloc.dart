import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super( const UserInitialState()) {

    on<ActivateUserEvent>( (event, emit) => emit( UserSetState(event.user) ));
    on<DeleteStateEvent>( (event, emit) => emit( const UserInitialState() ));
    
    on<ChangeUserAgeEvent>( (event, emit) {
      if(!state.userExists) return;

      emit( UserSetState( state.user!.copyWith( age: event.age) ));
    });

    on<AddProfessionEvent>( (event, emit) {
      if(!state.userExists) return;


      final List<String> copy = [...?state.user!.professions];
      copy.addAll(event.professions);


      emit( UserSetState( state.user!.copyWith( professions: copy) ));
    });




  }



}