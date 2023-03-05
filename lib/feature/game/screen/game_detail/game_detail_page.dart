import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/game/domain/model/game_response.dart';
import 'package:flutter_bil_hikmah/feature/game/logic/cubit/game_cubit.dart';
import 'package:flutter_bil_hikmah/feature/game/screen/game_detail/section/game_detail_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameDetailPage extends StatelessWidget {
  const GameDetailPage(
    this.title,
    this.currentLevel,
    this.game, {
    Key? key,
  }) : super(key: key);

  final String title;
  final int currentLevel;
  final Game game;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: title,
          ),
          body: state.status.isLoading || state.status.isError
              ? const Center(child: CircularProgressIndicator())
              : GameDetailView(
                  game,
                  title,
                ),
        );
      },
    );
  }
}
