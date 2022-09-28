part of 'game_detail_cubit.dart';

enum GameDetailStatus { initial, loading, loaded, error }

extension GameDetailStatusX on GameDetailStatus {
  bool get isInitial => this == GameDetailStatus.initial;
  bool get isLoading => this == GameDetailStatus.loading;
  bool get isLoaded => this == GameDetailStatus.loaded;
  bool get isError => this == GameDetailStatus.error;
}

class GameDetailState extends Equatable {
  const GameDetailState({
    this.status = GameDetailStatus.initial,
    this.database,
    this.currentLevel,
    this.gameDetailItem,
    this.exception,
  });

  final GameDetailStatus status;
  final Database? database;
  final int? currentLevel;
  final List<Map<String, dynamic>>? gameDetailItem;
  final AppException? exception;

  GameDetailState copyWith({
    GameDetailStatus? status,
    Database? database,
    int? currentLevel,
    List<Map<String, dynamic>>? gameDetailItem,
    AppException? exception,
  }) {
    return GameDetailState(
      status: status ?? this.status,
      database: database ?? this.database,
      currentLevel: currentLevel ?? this.currentLevel,
      gameDetailItem: gameDetailItem ?? this.gameDetailItem,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        database,
        gameDetailItem,
        exception,
      ];
}
