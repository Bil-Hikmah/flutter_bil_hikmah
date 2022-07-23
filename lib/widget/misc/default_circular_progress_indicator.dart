import 'package:flutter/material.dart';

class DefaultCircularProgress extends StatelessWidget {
  const DefaultCircularProgress({
    Key? key,
    this.width = 24,
    this.height = 24,
    this.strokeWidth = 3,
    this.color = Colors.white,
  }) : super(key: key);

  final double width;
  final double height;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color,
      ),
    );
  }
}
