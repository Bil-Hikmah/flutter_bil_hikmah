import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bil_hikmah/common/constant/game_item.dart';
import 'package:flutter_bil_hikmah/common/exception/exception.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

part 'init_app_state.dart';

class InitAppCubit extends Cubit<InitAppState> {
  InitAppCubit() : super(const InitAppState());

  Future<void> onInitiApp() async {
    emit(state.copyWith(status: InitAppStatus.loading));
    try {
      final database = await openDatabase(
        join(await getDatabasesPath(), 'gameVersion1.db'),
        onCreate: (db, version) {
          db.execute(
            'CREATE TABLE game(id INTEGER PRIMARY KEY, name TEXT, currentLevel INTEGER)',
          );
          db.insert(
            "game",
            GameItem(id: 1, name: "Hitung", currentLevel: 0).toMap(),
          );
          db.insert(
            "game",
            GameItem(id: 2, name: "Angka", currentLevel: 0).toMap(),
          );
          db.insert(
            "game",
            GameItem(id: 3, name: "Salam Perkenalan", currentLevel: 0).toMap(),
          );
          db.insert(
            "game",
            GameItem(id: 4, name: "Salam salam", currentLevel: 0).toMap(),
          );
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
      final db = state.database!;

      final List<Map<String, dynamic>> gameItem = await db.query('game');

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
}
