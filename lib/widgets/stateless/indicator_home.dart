import 'package:flutter/material.dart';

class IndicatorHome extends StatelessWidget {
  const IndicatorHome({Key? key, this.width, this.height, this.color, this.radius})
      : super(key: key);
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius!),
      ),
    );
  }
}