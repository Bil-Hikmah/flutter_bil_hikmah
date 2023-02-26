part of 'authentication_cubit.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  const AuthenticationState({
    required this.status,
    this.user,
  });

  final AuthenticationStatus status;
  final User? user;

  factory AuthenticationState.unknown() {
    return const AuthenticationState(status: AuthenticationStatus.unknown);
  }

  factory AuthenticationState.authenticated(User user) {
    return AuthenticationState(
      status: AuthenticationStatus.authenticated,
      user: user,
    );
  }

  factory AuthenticationState.unauthenticated() {
    return const AuthenticationState(
        status: AuthenticationStatus.unauthenticated);
  }

  @override
  List<Object?> get props => [status, user];
}
