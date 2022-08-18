import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';

import '../../../config/themes/text_style.dart';
import '../../../constants/assets_path.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class ItemsArrowSetting extends StatelessWidget {
  ItemsArrowSetting({
    Key? key,
    this.title,
    this.assetName,
    required this.onTap,
  }) : super(key: key);

  final String? title, assetName;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BodyItem(
      onTap: onTap,
      assetName: AssetPath.imgBackgroundItems,
      height: 32,
      widthImg: 32,
      mid: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Center(
          child: Text(
            title!,
            style: TxtStyle.headline4SemiBoldWhite,
          ),
        ),
      ),
      right: const Image(
        alignment: Alignment.centerRight,
        image: AssetImage(
          AssetPath.iconArrowRight,
        ),
      ),
      child: Center(
        child: Image(
          image: AssetImage(assetName!),
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
