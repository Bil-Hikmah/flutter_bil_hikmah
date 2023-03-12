part of 'feedback_cubit.dart';

enum FeedBackStateStatus { initial, loading, success, error }

class FeedbackState extends Equatable {
  const FeedbackState({
    this.status = FeedBackStateStatus.initial,
    this.errorMessage = "Unknown - Default",
  });

  final FeedBackStateStatus status;
  final String errorMessage;

  FeedbackState copyWith({
    FeedBackStateStatus? status,
    String? errorMessage,
  }) {
    return FeedbackState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
      ];
}
