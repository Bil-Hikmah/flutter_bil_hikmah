import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';

/// App Text Config. This is the default configuration for the text in the app.
class _AppTextConfig {
  static const String fontFamily = "Poppins";
  static const TextAlign textAlign = TextAlign.left;
  static const TextOverflow textOverflow = TextOverflow.ellipsis;
  static const bool softWrap = true;
  static const double height = 1.3;
  static const Color primaryColor = AppColors.darkGreyDarkest;
  static const int maxLines = 1;
}

/// App Text Weight. This is used to set the font weight of the text.
class AppTextWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

/// App Text Style. Use this class to create TextStyle.
class AppTextStyle {
  static const TextStyle textExtraSmall = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 10,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textSmall = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 12,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textMedium = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 14,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textLarge = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 16,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textExtraLarge = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 18,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textDoubleExtraLarge = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 20,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
  static const TextStyle textTripleExtraLarge = TextStyle(
    fontFamily: _AppTextConfig.fontFamily,
    fontSize: 10,
    height: _AppTextConfig.height,
    color: _AppTextConfig.primaryColor,
  );
}

class _AppText extends StatelessWidget {
  const _AppText(
    this.text, {
    this.softWrap = _AppTextConfig.softWrap,
    this.overflow = _AppTextConfig.textOverflow,
    this.align = _AppTextConfig.textAlign,
    this.maxLines = _AppTextConfig.maxLines,
    required this.style,
  });

  final String text;
  final bool softWrap;
  final TextOverflow overflow;
  final TextAlign align;
  final TextStyle style;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap,
      overflow: overflow,
      textAlign: align,
      style: style,
      maxLines: maxLines,
    );
  }

  _AppText copyWith({
    String? text,
    bool? softWrap,
    TextOverflow? overflow,
    TextAlign? align,
    TextStyle? style,
    int? maxLines,
  }) {
    return _AppText(
      text ?? this.text,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      align: align ?? this.align,
      style: style ?? this.style,
      maxLines: maxLines ?? this.maxLines,
    );
  }
}

//! App Text Primary
class AppTextExtraSmallPrimary extends _AppText {
  const AppTextExtraSmallPrimary(String text)
      : super(
          text,
          style: AppTextStyle.textExtraSmall,
        );
}

class AppTextSmallPrimary extends _AppText {
  const AppTextSmallPrimary(String text)
      : super(
          text,
          style: AppTextStyle.textSmall,
        );
}

class AppTextMediumPrimary extends _AppText {
  const AppTextMediumPrimary(String text)
      : super(
          text,
          style: AppTextStyle.textMedium,
        );
}

class AppTextLargePrimary extends _AppText {
  const AppTextLargePrimary(String text)
      : super(
          text,
          style: AppTextStyle.textLarge,
        );
}

class AppTextExtraLargePrimary extends _AppText {
  const AppTextExtraLargePrimary(String text)
      : super(
          text,
          style: AppTextStyle.textExtraLarge,
        );
}

class AppTextDoubleExtraLargePrimary extends _AppText {
  const AppTextDoubleExtraLargePrimary(String text)
      : super(
          text,
          style: AppTextStyle.textDoubleExtraLarge,
        );
}

class AppTextTripleExtraLargePrimary extends _AppText {
  const AppTextTripleExtraLargePrimary(String text)
      : super(
          text,
          style: AppTextStyle.textTripleExtraLarge,
        );
}

//! App Text Secondary
class AppTextExtraSmallGreen extends _AppText {
  AppTextExtraSmallGreen(String text)
      : super(
          text,
          style: AppTextStyle.textExtraSmall
              .copyWith(color: AppColors.primaryDark),
        );
}

class AppTextSmallGreen extends _AppText {
  AppTextSmallGreen(String text)
      : super(
          text,
          style: AppTextStyle.textSmall.copyWith(color: AppColors.primaryDark),
        );
}

class AppTextMediumGreen extends _AppText {
  AppTextMediumGreen(String text)
      : super(
          text,
          style: AppTextStyle.textMedium.copyWith(color: AppColors.primaryDark),
        );
}

class AppTextLargeGreen extends _AppText {
  AppTextLargeGreen(String text)
      : super(
          text,
          style: AppTextStyle.textLarge.copyWith(color: AppColors.primaryDark),
        );
}

class AppTextExtraLargeGreen extends _AppText {
  AppTextExtraLargeGreen(String text)
      : super(
          text,
          style: AppTextStyle.textExtraLarge
              .copyWith(color: AppColors.primaryDark),
        );
}

class AppTextDoubleExtraLargeGreen extends _AppText {
  AppTextDoubleExtraLargeGreen(String text)
      : super(
          text,
          style: AppTextStyle.textDoubleExtraLarge
              .copyWith(color: AppColors.primaryDark),
        );
}

class AppTextTripleExtraLargeGreen extends _AppText {
  AppTextTripleExtraLargeGreen(String text)
      : super(
          text,
          style: AppTextStyle.textTripleExtraLarge
              .copyWith(color: AppColors.primaryDark),
        );
}
