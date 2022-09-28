import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_exception/exception.dart';
import 'package:sqflite/sqflite.dart';

part 'game_detail_state.dart';

class GameDetailCubit extends Cubit<GameDetailState> {
  GameDetailCubit() : super(const GameDetailState());

  Future<void> onInitGameDetail(
    Database db,
    int currentLevel,
    int idGame,
  ) async {
    emit(state.copyWith(database: db, status: GameDetailStatus.loading));
    try {
      final List<Map<String, dynamic>> gameDetailItem =
          await state.database!.query(
        'gameDetail',
        where: 'idGameItem = ?',
        whereArgs: [idGame],
      );

      emit(state.copyWith(
        status: GameDetailStatus.loaded,
        currentLevel: currentLevel,
        gameDetailItem: gameDetailItem,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: GameDetailStatus.error,
        exception: e,
      ));
    }
  }

  Future<void> onUpdatedCurrentLevel(int idGame) async {
    emit(state.copyWith(status: GameDetailStatus.loading));
    try {
      final dbNow = await state.database!.query(
        "game",
        where: "id = ?",
        whereArgs: [idGame],
      );
      final int currentLevel = dbNow[0]["currentLevel"] as int;
      emit(state.copyWith(
        status: GameDetailStatus.loaded,
        currentLevel: currentLevel,
      ));
    } catch (e) {}
  }

  Future<void> onGetDetailItem(int idGame) async {
    state.copyWith(status: GameDetailStatus.loading);
    try {
      final List<Map<String, dynamic>> gameDetailItem =
          await state.database!.query(
        'gameDetail',
        where: 'idGameItem = ?',
        whereArgs: [idGame],
      );

      print(gameDetailItem);
      log(gameDetailItem.toString());

      emit(state.copyWith(
        status: GameDetailStatus.loaded,
        gameDetailItem: gameDetailItem,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GameDetailStatus.error,
        exception: UnknownException(
          message: e.toString(),
        ),
      ));
    }
  }
}
