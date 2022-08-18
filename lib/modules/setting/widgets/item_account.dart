import 'package:flutter/material.dart';

import '../../../config/themes/app_color.dart';
import '../../../config/themes/text_style.dart';
import '../../../constants/assets_path.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class SettingAccount extends StatelessWidget {
  const SettingAccount({
    Key? key,
    this.fullName = '',
    this.userName = '',
    this.assetName = '',
    required this.onTap,
  }) : super(key: key);

  final String? fullName, userName, assetName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BodyItem(
      onTap: onTap,
      height: 64,
      widthImg: 64,
      assetName: assetName,
      mid: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName!,
              style: TxtStyle.headline3SemiBoldWhite,
            ),
            Text(
              userName!,
              style: TxtStyle.headline5MediumWhite,
            ),
          ],
        ),
      ),
      right: const Image(
        alignment: Alignment.centerRight,
        image: AssetImage(
          AssetPath.iconArrowRight,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 4.0, bottom: 4),
          child: SizedBox(
            width: 16,
            height: 16,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: DarkTheme.white,
              ),
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage(AssetPath.iconCrown),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
