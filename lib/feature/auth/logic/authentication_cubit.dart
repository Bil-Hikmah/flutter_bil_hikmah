import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bil_hikmah/feature/auth/repository/authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState.unknown());

  final FirebaseAuth firebaseAuthentication = FirebaseAuth.instance;
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImplementation.create();

  Future currentAuthenticationStatus() async {
    try {
      return firebaseAuthentication.userChanges().listen((user) {
        if (user == null) {
          emit(AuthenticationState.unauthenticated());
        } else {
          authenticationRepository.loginAndRegisteredUser(user);
          emit(AuthenticationState.authenticated(user));
        }
      });
    } catch (e) {
      emit(AuthenticationState.unauthenticated());
    }
  }

  Future signOut() async {
    try {
      await firebaseAuthentication.signOut();
    } catch (e) {
      emit(AuthenticationState.unauthenticated());
    }
  }
}
