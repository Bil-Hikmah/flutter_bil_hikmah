import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/shadow.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

Widget _buildFaqRow({
  required IconData icon,
  required String text,
  required bool isQuestion,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        icon,
        color: AppColors.primaryDark,
        size: 24,
      ),
      const SizedBox(width: 13),
      Expanded(
        child: Text(
          text,
          style: (isQuestion)
              ? AppTextStyle.textMedium.copyWith(
                  fontWeight: FontWeight.bold,
                )
              : AppTextStyle.textMedium,
        ),
      ),
    ],
  );
}

Widget fAQTile(
  int index,
  String title,
  String content,
) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: AppShadow.card1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildFaqRow(
              icon: Icons.help,
              text: title,
              isQuestion: true,
            ),
            const SizedBox(height: 18),
            _buildFaqRow(
              icon: Icons.question_answer,
              text: content,
              isQuestion: false,
            ),
          ],
        ),
      ),
      Positioned(
        top: -10,
        left: -10,
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(20),
            boxShadow: AppShadow.card1,
          ),
          child: Center(
            child: Text(
              index.toString(),
              style: AppTextStyle.textSmall.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
