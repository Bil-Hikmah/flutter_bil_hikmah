import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class BasicLeadingIconTile extends StatelessWidget {
  const BasicLeadingIconTile({
    Key? key,
    required this.label,
    this.padding,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final IconData? icon;
  final VoidCallback? onTap;
  final String label;

  Widget _leadingIcon() {
    if (icon != null) {
      return Icon(
        icon,
        color: AppColors.primaryDark,
        size: 24,
      );
    }
    return Container(
      width: 24,
      height: 24,
      color: AppColors.lightGreyDark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 20,
            ),
        decoration: BoxDecoration(
          color: AppColors.lightGreyLight,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: <Widget>[
            _leadingIcon(),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: AppTextStyle.textMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
