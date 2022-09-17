import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    Widget _cardGame(String title, String level) {
      return Container(
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
                      level + " level",
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
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _cardGame(
          "Hitung",
          "12",
        );
      },
    );
  }
}
