part of 'game_cubit.dart';

enum GameStatus { initial, loading, loaded, error }

extension GameStatusX on GameStatus {
  bool get isInitial => this == GameStatus.initial;
  bool get isLoading => this == GameStatus.loading;
  bool get isLoaded => this == GameStatus.loaded;
  bool get isError => this == GameStatus.error;
}

class GameState extends Equatable {
  const GameState({
    this.status = GameStatus.initial,
    this.gameItem = const [],
    this.exception,
  });

  final GameStatus status;
  final List<Game> gameItem;
  final AppException? exception;

  GameState copyWith({
    GameStatus? status,
    List<Game>? gameItem,
    AppException? exception,
  }) {
    return GameState(
      status: status ?? this.status,
      gameItem: gameItem ?? this.gameItem,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        gameItem,
        exception,
      ];
}
