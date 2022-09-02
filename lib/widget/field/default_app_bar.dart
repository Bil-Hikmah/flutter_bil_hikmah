import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

AppBar defaultAppBar({
  required String title,
  Color backgroundColor = Colors.white,
  bool needBack = true,
  void Function()? onPressedBack,
  Color leadingColor = AppColors.darkGreyMedium,
}) {
  final _title = Text(
    title,
    style: AppTextStyle.textExtraLarge.copyWith(
      color: AppColors.primaryDark,
      fontWeight: FontWeight.bold,
    ),
  );
  return AppBar(
    title: _title,
    elevation: 0,
    backgroundColor: backgroundColor,
    centerTitle: true,
    leading: needBack
        ? IconButton(
            onPressed: onPressedBack,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: leadingColor,
              size: 12.0,
            ),
          )
        : null,
  );
}
