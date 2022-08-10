import 'package:flutter/material.dart';

import '../../../config/themes/app_color.dart';
import '../../../config/themes/text_style.dart';
import '../../../constants/assets_path.dart';
import '../../../widgets/stless/common_bodyitem.dart';

class ItemLanguage extends StatefulWidget {
  const ItemLanguage({
    Key? key,
    this.assetName,
    this.nameLang,
  }) : super(key: key);

  final String? assetName, nameLang;

  @override
  State<ItemLanguage> createState() => _ItemLanguageState();
}

class _ItemLanguageState extends State<ItemLanguage> {
  bool? _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyItem(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected!;
            });
          },
          assetName: widget.assetName,
          mid: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: SizedBox(
              width: 200,
              child: Text(
                widget.nameLang!,
                style: _isSelected!
                    ? TxtStyle.headline4blue
                    : TxtStyle.headline4SemiBoldWhite,
              ),
            ),
          ),
          height: 16,
          radius: 2,
          widthImg: 24,
          right: _isSelected!
              ? const Image(
                  image: AssetImage(AssetPath.iconChecked),
                  color: DarkTheme.primaryBlue600,
                )
              : const Text(''),
        ),
        const SizedBox(height: 21),
        Divider(color: DarkTheme.greyScale50.withOpacity(0.8)),
      ],
    );
  }
}
