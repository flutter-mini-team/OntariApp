import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';

class TxtStyle {
  static const headline1Bold = TextStyle(
    fontWeight: FontWeight.w700,
    color: DarkTheme.greyScale700,
    fontSize: 26,
  );

  static const headline2Bold = TextStyle(
    fontWeight: FontWeight.w700,
    color: DarkTheme.greyScale700,
    fontSize: 22,
  );

  static const headline3SemiBold = TextStyle(
    fontWeight: FontWeight.w700,
    color: DarkTheme.greyScale700,
    fontSize: 16,
  );

  static const headline4SemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: DarkTheme.greyScale700,
    fontSize: 14,
  );

  static const headline5Medium = TextStyle(
    fontWeight: FontWeight.w500,
    color: DarkTheme.greyScale700,
    fontSize: 14,
  );

  static const headline6Medium = TextStyle(
    fontWeight: FontWeight.w500,
    color: DarkTheme.greyScale700,
    fontSize: 12,
  );

  static const bodyLargeMedium = TextStyle(
    fontWeight: FontWeight.w500,
    color: DarkTheme.greyScale700,
    fontSize: 16,
  );

  static const bodyLargeRegular = TextStyle(
    fontWeight: FontWeight.w400,
    color: DarkTheme.greyScale700,
    fontSize: 16,
  );

  static const bodyMedium = TextStyle(
    fontWeight: FontWeight.w500,
    color: DarkTheme.greyScale700,
    fontSize: 14,
  );

  static const bodyMediumRegular = TextStyle(
    fontWeight: FontWeight.w400,
    color: DarkTheme.greyScale700,
    fontSize: 14,
  );

  static const bodySmallMedium = TextStyle(
    fontWeight: FontWeight.w500,
    color: DarkTheme.greyScale700,
    fontSize: 12,
  );

  static const bodySmallRegular = TextStyle(
    fontWeight: FontWeight.w400,
    color: DarkTheme.greyScale700,
    fontSize: 12,
  );

  static const buttonLargeSemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: DarkTheme.greyScale700,
    fontSize: 16,
  );

  static const buttonMediumSemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: DarkTheme.greyScale700,
    fontSize: 14,
  );

  static const buttonSmallSemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: DarkTheme.greyScale700,
    fontSize: 12,
  );
}

// class GradientText extends StatelessWidget {
//   GradientText(
//     this.text, {
//     @required this.gradient,
//   });

//   final String text;
//   final Gradient? gradient;

//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (bounds) => gradient!.createShader(
//         Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           // The color must be set to white for this to work
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
// }
