import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential

      return await FirebaseAuth.instance.signInWithCredential(credential).then(
        (user) {
          emit(state.copyWith(status: LoginStatus.success));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  Future<void> signOutGoogle() async {
    try {
      await googleSignIn.signOut();
    } catch (e) {
      print("exception when logut ${e.toString()}");
    }
  }
}
