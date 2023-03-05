import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bil_hikmah/feature/auth/repository/authentication_repository.dart';
import 'package:flutter_bil_hikmah/feature/auth/repository/bilhikmah_user.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.authenticationRepository)
      : super(AuthenticationState.unknown());

  final FirebaseAuth firebaseAuthentication = FirebaseAuth.instance;
  final AuthenticationRepository authenticationRepository;

  Future currentAuthenticationStatus() async {
    try {
      return firebaseAuthentication.userChanges().listen((user) async {
        if (user == null) {
          emit(AuthenticationState.unauthenticated());
        } else {
          final response =
              await authenticationRepository.loginAndRegisteredUser(user);
          emit(AuthenticationState.authenticated(response));
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

  Future<void> updateUserGameData(String gameName, int updateLevel) async {
    try {
      final Map<String, int> newDataEntry = {gameName: updateLevel};
      final Map<String, dynamic> data = state.user!.currentStatusGame;
      data.addAll(newDataEntry);
      final response = await authenticationRepository.updateUserDataGame(
        data,
        state.user!.id!,
      );
      if (response) {
        emit(state.copyWith(
          user: state.user!.copyWith(
            currentStatusGame: data,
          ),
        ));
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
