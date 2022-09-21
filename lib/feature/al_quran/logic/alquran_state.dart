part of 'alquran_cubit.dart';

enum AlquranStatus {
  initial,
  loading,
  success,
  failure,
}

extension AlquranStatusX on AlquranStatus {
  bool get isInitial => this == AlquranStatus.initial;
  bool get isLoading => this == AlquranStatus.loading;
  bool get isSuccess => this == AlquranStatus.success;
  bool get isFailure => this == AlquranStatus.failure;
}

class AlquranState extends Equatable {
  const AlquranState({
    this.status = AlquranStatus.initial,
    this.exception,
    this.alQuranAll,
  });

  final AlquranStatus status;
  final AppException? exception;
  final List<QuranItemData>? alQuranAll;

  AlquranState copyWith({
    AlquranStatus? status,
    AppException? exception,
    List<QuranItemData>? alQuranAll,
  }) {
    return AlquranState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      alQuranAll: alQuranAll ?? this.alQuranAll,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        alQuranAll,
      ];
}
