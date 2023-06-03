import 'package:api_exception/exception.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bil_hikmah/feature/game/domain/repository/game_repsoitory.dart';
import 'package:flutter_bil_hikmah/feature/game/logic/cubit/game_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'game_test.mocks.dart';

@GenerateMocks([GameRepository])
void main() {
  late MockGameRepository mockGameRepository;
  setUp(() {
    mockGameRepository = MockGameRepository();
  });

  group(
    "Test logic game cubit",
    () {
      blocTest<GameCubit, GameState>(
        "On get all game with empty data / success",
        build: () => GameCubit(mockGameRepository, {}),
        setUp: () {
          when(mockGameRepository.onGetGameItem())
              .thenAnswer((realInvocation) async => []);
        },
        act: (cubit) => cubit.onGetGame(),
        expect: () => [
          const GameState(status: GameStatus.loading),
          const GameState(
            status: GameStatus.loaded,
            gameItem: [],
          ),
        ],
      );

      blocTest<GameCubit, GameState>(
        "On get all game with exception",
        build: () => GameCubit(mockGameRepository, {}),
        setUp: () {
          when(mockGameRepository.onGetGameItem()).thenThrow(
            (_) async => const UnknownException(
                message: "Error Unknown", errorType: ErrorType.unknown),
          );
        },
        act: (cubit) => cubit.onGetGame(),
        expect: () => [
          const GameState(status: GameStatus.loading),
          const GameState(
            status: GameStatus.error,
            exception: UnknownException(
                message: "Closure: (dynamic) => Future<UnknownException>"),
          ),
        ],
      );
    },
  );
}
