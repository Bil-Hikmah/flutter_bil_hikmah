import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/game/screen/section/game_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const GamePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Game Edukasi",
      ),
      body: const GameView(),
    );
  }
}
