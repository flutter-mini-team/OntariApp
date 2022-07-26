import 'package:flutter/material.dart';

import '../../config/themes/app_color.dart';

class ClassicButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final double? widthRadius;
  final Color? colorRadius;
  final Widget? child;
  final VoidCallback? onTap;

  const ClassicButton({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.radius,
    this.widthRadius,
    this.colorRadius,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: widthRadius!,
            color: colorRadius!,
          ),
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: child,
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final String? assetPath;
  final Color? bgColor;
  final VoidCallback? onTap;

  const CircleButton({
    Key? key,
    this.assetPath,
    this.bgColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: ImageIcon(
          color: DarkTheme.white,
          AssetImage(assetPath!),
        ),
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  final double? edge;
  final double? radius;
  final Color? bgColor;
  final Widget? child;
  final VoidCallback? onTap;

  const SquareButton({
    Key? key,
    this.edge,
    this.radius,
    this.bgColor,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius!),
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: edge,
          width: edge,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(radius!),
          ),
          child: child),
    );
  }
}
