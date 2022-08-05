import 'package:flutter/material.dart';

import '../../../config/themes/text_style.dart';
import '../../../constants/assets_path.dart';
import '../../../widgets/stless/common_bodyitem.dart';

class CategoryOffice extends StatelessWidget {
  CategoryOffice({
    Key? key,
    this.assetIcon,
    this.title,
    this.countMentor,
    this.onTap,
  }) : super(key: key);

  final String? assetIcon, title, countMentor;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BodyItem(
      onTap: onTap,
      assetName: AssetPath.imgBackgroundItems,
      widthImg: 48,
      height: 48,
      child: Center(
        child: Image(image: AssetImage(assetIcon!)),
      ),
      mid: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: TxtStyle.titleItemActivity,
            ),
            Text(
              countMentor!,
              style: TxtStyle.headline6MediumGrey,
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
    );
  }
}
