import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_svg/svg.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem(this.callback, this.active, this.svgSource, this.label,
      {Key? key})
      : super(key: key);

  final VoidCallback callback;
  final bool active;
  final String svgSource;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: callback,
          iconSize: 24.0,
          icon: SvgPicture.asset(
            svgSource,
            color: active ? AppColors.primaryDark : AppColors.bottomNabBarColor,
          ),
        ),
        Text(
          label,
          style: AppTextStyle.textSmall.copyWith(
            color: active ? AppColors.primaryDark : AppColors.bottomNabBarColor,
            height: 0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
