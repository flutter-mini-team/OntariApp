import 'package:flutter/material.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/text_style.dart';
import '../../../widgets/stateful/toggle_switch_button.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class ItemsToggleSetting extends StatelessWidget {
  const ItemsToggleSetting({
    Key? key,
    this.title,
    this.assetName,
  }) : super(key: key);

  final String? title, assetName;

  @override
  Widget build(BuildContext context) {
    return BodyItemAsset(
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
      right: const Padding(
        padding: EdgeInsets.only(left: 145.0),
        child: ToggleSwitchButton(),
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
