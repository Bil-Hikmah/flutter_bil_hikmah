import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/onboard/screen/section/onboard_indicator.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/button/default_button.dart';

class OnboardActionButton extends StatelessWidget {
  const OnboardActionButton(
    this.contentLength,
    this.scrollIndex,
    this.onPressedSkip,
    this.onPressedNext,
    this.onPressedFinish, {
    Key? key,
  }) : super(key: key);

  final int contentLength;
  final int scrollIndex;
  final void Function() onPressedSkip;
  final void Function() onPressedNext;
  final void Function() onPressedFinish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OnboardIndicator(
            contentLength,
            scrollIndex,
          ),
          scrollIndex == (contentLength - 1)
              ? ButtonDefault(
                  text: 'Masuk',
                  onPressed: onPressedFinish,
                  isBlockSize: true,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: onPressedSkip,
                      child: const AppTextMediumPrimary("Lewati").copyWith(
                        style: AppTextStyle.textMedium.copyWith(
                          color: AppColors.lightGreyDark,
                        ),
                      ),
                    ),
                    ButtonDefault(
                      text: "Selanjutnya",
                      onPressed: onPressedNext,
                      isBlockSize: false,
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
