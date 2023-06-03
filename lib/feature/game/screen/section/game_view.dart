import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/auth/logic/authentication_cubit.dart';
import 'package:flutter_bil_hikmah/feature/game/domain/model/game_response.dart';
import 'package:flutter_bil_hikmah/feature/game/logic/cubit/game_cubit.dart';
import 'package:flutter_bil_hikmah/feature/game/screen/game_detail/game_detail_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameView extends StatefulWidget {
  const GameView(
    this.gameItem,
    this.userCurrentLevel, {
    Key? key,
  }) : super(key: key);

  final List<Game> gameItem;
  final Map<String, dynamic>? userCurrentLevel;

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    Widget _cardGame(
      String title,
      int level,
      Game game,
      int? currentLevel,
    ) {
      return GestureDetector(
        onTap: () {
          if (currentLevel == null) {
            BlocProvider.of<AuthenticationCubit>(context)
                .updateUserGameData(title, 0);
          }
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (newContext) {
                return BlocProvider.value(
                  value: BlocProvider.of<GameCubit>(context),
                  child: GameDetailPage(
                    title,
                    currentLevel ?? 0,
                    game,
                  ),
                );
              },
            ),
          );
        },
        child: Container(
          height: 164.0,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: AppColors.secondaryMedium,
              width: 1.0,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 120.0,
                child: Stack(
                  children: [
                    Container(
                      height: 120.0,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 50.0),
                          child: Container(
                            // the size where the blurring starts
                            height: 20.0,
                            color: Colors.white24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.textExtraLarge.copyWith(
                            color: AppColors.secondaryMedium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        level.toString() + " level",
                        style: AppTextStyle.textSmall.copyWith(
                          color: AppColors.darkGreyDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget _newCardGame(
      String title,
      int level,
      Game game,
      int? currentLevel,
    ) {
      return InkWell(
        onTap: () {
          if (currentLevel == null) {
            BlocProvider.of<AuthenticationCubit>(context)
                .updateUserGameData(title, 0);
          }
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (newContext) {
                return BlocProvider.value(
                  value: BlocProvider.of<GameCubit>(context),
                  child: GameDetailPage(
                    title,
                    currentLevel ?? 0,
                    game,
                  ),
                );
              },
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 24.0),
          child: Row(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.primaryDark,
                  image: DecorationImage(
                    image: NetworkImage(game.bannerURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.textExtraLarge.copyWith(
                        color: AppColors.darkGreyDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.secondaryMedium.withOpacity(0.3),
                      ),
                      child: Text(
                        (currentLevel ?? 0).toString() + "/ $level level",
                        style: AppTextStyle.textSmall
                            .copyWith(color: AppColors.secondaryMedium),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Mainkan Sekarang",
                          style: AppTextStyle.textMedium.copyWith(
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.primaryDark,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: widget.gameItem.length,
      itemBuilder: (context, index) {
        return _newCardGame(
          widget.gameItem[index].name,
          widget.gameItem[index].questions.length,
          widget.gameItem[index],
          widget.userCurrentLevel?[widget.gameItem[index].name],
        );
      },
    );
  }
}
