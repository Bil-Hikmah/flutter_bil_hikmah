part of 'poster_cubit.dart';

enum PosterStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class PosterState extends Equatable {
  const PosterState({
    this.status = PosterStateStatus.initial,
    this.errorMessage,
    this.poster = const [],
  });

  final PosterStateStatus status;
  final String? errorMessage;
  final List<PosterResponse> poster;

  PosterState copyWith({
    PosterStateStatus? status,
    String? errorMessage,
    List<PosterResponse>? poster,
  }) {
    return PosterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      poster: poster ?? this.poster,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        poster,
      ];
}
