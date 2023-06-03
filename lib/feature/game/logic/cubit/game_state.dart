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
    this.userCurrentLevel,
  });

  final GameStatus status;
  final List<Game> gameItem;
  final AppException? exception;
  final Map<String, dynamic>? userCurrentLevel;

  GameState copyWith({
    GameStatus? status,
    List<Game>? gameItem,
    AppException? exception,
    Map<String, dynamic>? userCurrentLevel,
  }) {
    return GameState(
      status: status ?? this.status,
      gameItem: gameItem ?? this.gameItem,
      exception: exception ?? this.exception,
      userCurrentLevel: userCurrentLevel ?? this.userCurrentLevel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        gameItem,
        exception,
        userCurrentLevel,
      ];
}
