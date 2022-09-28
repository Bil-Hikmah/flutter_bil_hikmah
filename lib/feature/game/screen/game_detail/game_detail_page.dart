import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/game/logic/cubit/game_detail_cubit.dart';
import 'package:flutter_bil_hikmah/feature/game/screen/game_detail/section/game_detail_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class GameDetailPage extends StatefulWidget {
  const GameDetailPage(
    this.title,
    this.idGame,
    this.currentLevel,
    this.db, {
    Key? key,
  }) : super(key: key);

  final String title;
  final int idGame;
  final int currentLevel;

  final Database db;

  static Route route(
    String title,
    int idGame,
    int currentLevel,
    Database db,
  ) =>
      MaterialPageRoute(
        builder: ((_) => GameDetailPage(
              title,
              idGame,
              currentLevel,
              db,
            )),
      );

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  late int currentLevelVal;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameDetailCubit()
        ..onInitGameDetail(
          widget.db,
          widget.currentLevel,
          widget.idGame,
        ),
      child: BlocBuilder<GameDetailCubit, GameDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: widget.title,
            ),
            body: state.status.isLoading || state.status.isError
                ? const Center(child: CircularProgressIndicator())
                : GameDetailView(widget.idGame),
          );
        },
      ),
    );
  }
}
