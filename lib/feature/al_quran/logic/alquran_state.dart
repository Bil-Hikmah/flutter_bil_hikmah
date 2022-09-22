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
    this.surahDetail,
  });

  final AlquranStatus status;
  final AppException? exception;
  final List<QuranItemData>? alQuranAll;
  final SurahItem? surahDetail;

  AlquranState copyWith({
    AlquranStatus? status,
    AppException? exception,
    List<QuranItemData>? alQuranAll,
    SurahItem? surahDetail,
  }) {
    return AlquranState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      alQuranAll: alQuranAll ?? this.alQuranAll,
      surahDetail: surahDetail ?? this.surahDetail,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        alQuranAll,
        surahDetail,
      ];
}
