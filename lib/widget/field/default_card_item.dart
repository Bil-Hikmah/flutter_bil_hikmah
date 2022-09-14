import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

InkWell defaultItemCard(
  String title,
  void Function() route,
) {
  return InkWell(
    onTap: route,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 29,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.lightGreyLight,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.textLarge
                  .copyWith(color: AppColors.darkGreyDark),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.primaryDark,
          ),
        ],
      ),
    ),
  );
}
