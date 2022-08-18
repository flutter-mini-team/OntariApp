import 'package:flutter/material.dart';

import '../../../config/themes/app_color.dart';
import '../../../config/themes/text_style.dart';
import '../../../constants/assets_path.dart';
import '../../../widgets/stateless/common_button.dart';

class ActivityEmpty extends StatelessWidget {
  const ActivityEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 40),
        SquareButton(
          edge: 56,
          radius: 9.69,
          bgColor: DarkTheme.greyScale800,
          child: Image(
            width: 24,
            height: 24,
            color: DarkTheme.greyScale400,
            image: AssetImage(
              AssetPath.iconSearch,
            ),
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Empty Course',
          style: TxtStyle.headline3SemiBoldWhite,
        ),
        Text(
          'Search your course again ',
          style: TxtStyle.headline5MediumWhite,
        ),
        SizedBox(height: 32),
        ClassicButton(
          color: DarkTheme.primaryBlue600,
          radius: 12,
          widthRadius: 0,
          colorRadius: DarkTheme.primaryBlue600,
          width: 140,
          height: 52,
          child: Text(
            'Explore',
            style: TxtStyle.headline4SemiBoldWhite,
          ),
        ),
      ],
    );
  }
}