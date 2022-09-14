import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';

class AppShadow {
  static List<BoxShadow> card1 = [
    const BoxShadow(
      color: AppColors.lightGreyDark,
      offset: Offset(0, 2),
      blurRadius: 6,
    ),
  ];
  static final cardShadowDarkGreyLight = [
    const BoxShadow(
      offset: Offset(10, 15),
      blurRadius: 15,
      color: AppColors.darkGreyLight,
    ),
  ];
  static final cardShadowPrimaryDark = [
    const BoxShadow(
      offset: Offset(10, 15),
      blurRadius: 15,
      color: AppColors.primaryDark,
    ),
  ];
}
