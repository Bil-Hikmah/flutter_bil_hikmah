import 'package:api_exception/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'init_app_state.dart';

class InitAppCubit extends Cubit<InitAppState> {
  InitAppCubit() : super(const InitAppState());

  Future<void> onInitiApp() async {
    emit(state.copyWith(status: InitAppStatus.loading));
    try {
      emit(state.copyWith(
        status: InitAppStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: InitAppStatus.error,
        exception: UnknownException(
          message: e.toString(),
        ),
      ));
    }
  }

  Future<void> onGetGameItem() async {
    state.copyWith(status: InitAppStatus.loading);
    try {
      final List<Map<String, dynamic>> gameItem =
          await state.database!.query('game');

      emit(state.copyWith(
        status: InitAppStatus.success,
        gameItem: gameItem,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: InitAppStatus.error,
        exception: UnknownException(
          message: e.toString(),
        ),
      ));
    }
  }

  Future<void> onGetDetailItem(int idGame) async {
    state.copyWith(status: InitAppStatus.loading);
    try {
      final List<Map<String, dynamic>> gameDetailItem =
          await state.database!.query(
        'gameDetail',
        where: 'idGameItem = ?',
        whereArgs: [idGame],
      );

      emit(state.copyWith(
        status: InitAppStatus.success,
        gameDetailItem: gameDetailItem,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: InitAppStatus.error,
        exception: UnknownException(
          message: e.toString(),
        ),
      ));
    }
  }

  Future<void> onUnlockItem(
    int idGame,
    int currentLevel,
  ) async {
    state.copyWith(status: InitAppStatus.loading);
    try {
      await state.database!.update(
        'game',
        {'currentLevel': currentLevel},
        where: 'id = ?',
        whereArgs: [idGame],
      );

      await onGetGameItem();

      emit(state.copyWith(
        status: InitAppStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: InitAppStatus.error,
        exception: UnknownException(
          message: e.toString(),
        ),
      ));
    }
  }
}
