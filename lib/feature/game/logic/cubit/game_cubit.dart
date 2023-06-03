import 'package:api_exception/api_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/feature/game/domain/model/game_response.dart';
import 'package:flutter_bil_hikmah/feature/game/domain/repository/game_repsoitory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(
    this.repository,
    this.currentStatusGameFromUser,
  ) : super(const GameState());

  final GameRepository repository;
  final Map<String, dynamic> currentStatusGameFromUser;

  Future<void> onGetGame() async {
    emit(state.copyWith(status: GameStatus.loading));
    try {
      final response = await repository.onGetGameItem();
      emit(state.copyWith(
        status: GameStatus.loaded,
        gameItem: response,
        userCurrentLevel: currentStatusGameFromUser,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: GameStatus.error,
        exception: e,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GameStatus.error,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }
}
