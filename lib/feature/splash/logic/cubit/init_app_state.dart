part of 'init_app_cubit.dart';

enum InitAppStatus {
  initial,
  loading,
  success,
  error,
}

extension InitAppStatusX on InitAppStatus {
  bool get isInitial => this == InitAppStatus.initial;
  bool get isLoading => this == InitAppStatus.loading;
  bool get isSuccess => this == InitAppStatus.success;
  bool get isError => this == InitAppStatus.error;
}

class InitAppState extends Equatable {
  const InitAppState({
    this.status = InitAppStatus.initial,
    this.exception,
    this.database,
    this.gameItem,
    this.gameDetailItem,
  });

  final InitAppStatus status;
  final AppException? exception;
  final Database? database;
  final List<Map<String, dynamic>>? gameItem;
  final List<Map<String, dynamic>>? gameDetailItem;

  InitAppState copyWith({
    InitAppStatus? status,
    AppException? exception,
    Database? database,
    List<Map<String, dynamic>>? gameItem,
    List<Map<String, dynamic>>? gameDetailItem,
  }) {
    return InitAppState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      database: database ?? this.database,
      gameItem: gameItem ?? this.gameItem,
      gameDetailItem: gameDetailItem ?? this.gameDetailItem,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        database,
        gameItem,
        gameDetailItem,
      ];
}
