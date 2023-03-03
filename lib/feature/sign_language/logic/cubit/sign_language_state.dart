part of 'sign_language_cubit.dart';

enum SignLanguageStateStatus { initial, loading, loaded, error }

class SignLanguageState extends Equatable {
  const SignLanguageState({
    this.status = SignLanguageStateStatus.initial,
    this.errorMessage = "",
    this.signLanguageResponse = const [],
  });

  final SignLanguageStateStatus status;
  final String errorMessage;
  final List<SignLanguageResponse> signLanguageResponse;

  SignLanguageState copyWith({
    SignLanguageStateStatus? status,
    String? errorMessage,
    List<SignLanguageResponse>? signLanguageResponse,
  }) {
    return SignLanguageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      signLanguageResponse: signLanguageResponse ?? this.signLanguageResponse,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
        signLanguageResponse,
      ];
}
