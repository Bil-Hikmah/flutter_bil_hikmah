import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/game/logic/cubit/game_cubit.dart';
import 'package:flutter_bil_hikmah/feature/game/screen/section/game_view.dart';
import 'package:flutter_bil_hikmah/feature/splash/logic/cubit/init_app_cubit.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const GamePage(),
      );

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    BlocProvider.of<InitAppCubit>(context).onGetGameItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit()..onGetGame(),
      child: BlocConsumer<GameCubit, GameState>(
        listener: (context, state) {
          if (state.status.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.exception?.message.toString() ?? "Unknown"),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: "Game Edukasi",
            ),
            body: state.status.isLoading || state.status.isError
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GameView(state.gameItem),
          );
        },
      ),
    );
  }
}
