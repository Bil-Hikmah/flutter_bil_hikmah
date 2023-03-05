import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/auth/logic/authentication_cubit.dart';
import 'package:flutter_bil_hikmah/feature/game/domain/model/game_response.dart';
import 'package:flutter_bil_hikmah/feature/game/logic/cubit/game_cubit.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/button/default_button.dart';
import 'package:flutter_bil_hikmah/widget/field/default_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameDetailView extends StatefulWidget {
  const GameDetailView(
    this.game,
    this.title, {
    Key? key,
  }) : super(key: key);
  final Game game;
  final String title;

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView> {
  bool isVisible = false;
  Widget? popUpWidget;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController answerController = TextEditingController();

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

    Widget _buildPopUpGame(
      String image,
      String answerKey,
      void Function() onAnswered,
    ) =>
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.network(image, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 8.0),
                    Text(
                      'Tebak jawabannya apa ?',
                      style: AppTextStyle.textMedium.copyWith(
                        color: AppColors.darkGreyDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    DefaultTextField(
                      controller: answerController,
                      hintText: 'Masukan Jawaban Anda',
                      validator: (validatorValue) {
                        if (validatorValue!.isEmpty) {
                          return 'Jawaban tidak boleh kosong';
                        }
                        if (validatorValue != answerKey) {
                          return 'Jawaban anda salah';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    ButtonDefault(
                      text: 'Jawab',
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        if (answerController.text == answerKey) {
                          onAnswered();
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );

    Widget _buildPopUpGameContainer(
      String image,
      String answerKey,
      void Function() onAnswered,
    ) =>
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isVisible = false;
                  answerController.clear();
                });
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
            ),
            Center(
              child: _buildPopUpGame(
                image,
                answerKey,
                onAnswered,
              ),
            ),
          ],
        );

    return BlocConsumer<GameCubit, GameState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return state.status.isLoading ||
                state.status.isError ||
                state.status.isInitial
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: formKey,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 24.0),
                        Expanded(
                          child: GridView.builder(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 24.0,
                            ),
                            itemCount: widget.game.questions.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (BlocProvider.of<AuthenticationCubit>(
                                              context)
                                          .state
                                          .user!
                                          .currentStatusGame[widget.title] >=
                                      index) {
                                    //Note Change popuup widget to visible
                                    setState(() {
                                      isVisible = true;
                                      popUpWidget = _buildPopUpGameContainer(
                                        widget.game.questions[index].imageURL,
                                        widget.game.questions[index].key,
                                        () {
                                          if (BlocProvider.of<AuthenticationCubit>(
                                                          context)
                                                      .state
                                                      .user!
                                                      .currentStatusGame[
                                                  widget.title] ==
                                              index) {
                                            // Note Unlock next level and set up pop up widget to invisible
                                            BlocProvider.of<
                                                        AuthenticationCubit>(
                                                    context)
                                                .updateUserGameData(
                                              widget.title,
                                              index + 1,
                                            )
                                                .then((value) {
                                              setState(() {
                                                answerController.clear();
                                                isVisible = false;
                                              });
                                            });
                                          }
                                        },
                                      );
                                    });
                                  }
                                },
                                child: _gameItem(
                                  index,
                                  BlocProvider.of<AuthenticationCubit>(context)
                                          .state
                                          .user!
                                          .currentStatusGame[widget.title] >=
                                      index,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isVisible,
                      child: popUpWidget ?? const SizedBox(),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
