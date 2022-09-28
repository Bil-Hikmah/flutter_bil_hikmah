import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/game/logic/cubit/game_detail_cubit.dart';
import 'package:flutter_bil_hikmah/feature/splash/logic/cubit/init_app_cubit.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameDetailView extends StatefulWidget {
  const GameDetailView(
    this.gameID, {
    Key? key,
  }) : super(key: key);

  final int gameID;

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    Widget _gameItem(
      int level,
      bool isUnlocked,
    ) =>
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: isUnlocked
                ? AppColors.secondaryMedium
                : AppColors.lightGreyLight,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: AppColors.lightGreyLight),
          ),
          alignment: Alignment.center,
          child: Center(
            child: isUnlocked
                ? Text(
                    (level + 1).toString(),
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.textLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                : const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.darkGreyLightest,
                  ),
          ),
        );

    return BlocConsumer<GameDetailCubit, GameDetailState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return state.status.isLoading ||
                state.status.isError ||
                state.status.isInitial
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 24.0),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 24.0,
                          ),
                          itemCount: state.gameDetailItem!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (context
                                        .read<GameDetailCubit>()
                                        .state
                                        .currentLevel! >=
                                    context
                                        .read<GameDetailCubit>()
                                        .state
                                        .gameDetailItem![index]["level"]) {
                                  // Note going to another page if level Unlocked
                                  BlocProvider.of<InitAppCubit>(context)
                                      .onUnlockItem(
                                    state.gameDetailItem![index]["idGameItem"],
                                    state.gameDetailItem![index]["level"] + 1,
                                  )
                                      .then((value) {
                                    context
                                        .read<GameDetailCubit>()
                                        .onUpdatedCurrentLevel(
                                          widget.gameID,
                                        );
                                  });

                                  setState(() {});
                                }
                              },
                              child: _gameItem(
                                state.gameDetailItem![index]["level"],
                                state.currentLevel! >=
                                    state.gameDetailItem![index]["level"],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Container(),
                  ),
                ],
              );
      },
    );
  }
}
