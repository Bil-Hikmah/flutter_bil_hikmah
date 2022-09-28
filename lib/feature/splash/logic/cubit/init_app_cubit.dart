import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/common/constant/game_data.dart';
import 'package:flutter_bil_hikmah/common/constant/game_item.dart';
import 'package:flutter_exception/flutter_exception.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

part 'init_app_state.dart';

class InitAppCubit extends Cubit<InitAppState> {
  InitAppCubit() : super(const InitAppState());

  Future<void> onInitiApp() async {
    emit(state.copyWith(status: InitAppStatus.loading));
    try {
      final database = await openDatabase(
        join(await getDatabasesPath(), 'gameVersion7.db'),
        onCreate: (db, version) {
          // Note : Execute the "CREATE TABLE" query
          db.execute(
            'CREATE TABLE game(id INTEGER PRIMARY KEY, name TEXT, currentLevel INTEGER,totalLevel INTEGER)',
          );
          db.execute(
            'CREATE TABLE gameDetail(id INTEGER PRIMARY KEY, idGameItem INTEGER, level INTEGER, answerKey TEXT, questionData TEXT)',
          );
          // Note : Excute insert Game Hitung
          db.insert(
            "game",
            GameItem(
              id: 1,
              name: "Hitung",
              currentLevel: 0,
              totalLevel: 3,
            ).toMap(),
          );
          for (int i = 0; i < listGameDetailHitung.length; i++) {
            db.insert(
              "gameDetail",
              GameItemDetail(
                id: listGameDetailHitung[i].id,
                idGameItem: 1,
                level: i,
                answerKey: listGameDetailHitung[i].answerKey,
                questionData: listGameDetailHitung[i].questionData,
              ).toMap(),
            );
          }
          // Note : Excute insert Game Angka
          db.insert(
            "game",
            GameItem(
              id: 2,
              name: "Angka",
              currentLevel: 0,
              totalLevel: 2,
            ).toMap(),
          );
          for (int i = 0; i < listGameDetailAngka.length; i++) {
            db.insert(
              "gameDetail",
              GameItemDetail(
                id: listGameDetailAngka[i].id,
                idGameItem: 2,
                level: i,
                answerKey: listGameDetailAngka[i].answerKey,
                questionData: listGameDetailAngka[i].questionData,
              ).toMap(),
            );
          }
        },
        version: 1,
      );

      emit(state.copyWith(
        status: InitAppStatus.success,
        database: database,
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
