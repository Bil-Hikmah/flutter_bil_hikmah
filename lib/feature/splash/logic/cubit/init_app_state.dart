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
  });

  final InitAppStatus status;
  final AppException? exception;
  final Database? database;
  final List<Map<String, dynamic>>? gameItem;

  InitAppState copyWith({
    InitAppStatus? status,
    AppException? exception,
    Database? database,
    List<Map<String, dynamic>>? gameItem,
  }) {
    return InitAppState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      database: database ?? this.database,
      gameItem: gameItem ?? this.gameItem,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        database,
        gameItem,
      ];
}
