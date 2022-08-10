import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';

import '../../config/themes/app_color.dart';
import '../../models/model_local.dart';
import 'components/items_my_favorite.dart';
import 'components/title_setting.dart';

class MyFavoritePage extends StatelessWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleSetting(title: 'My Favorite'),
              buildListView(myFavorite),
            ],
          ),
        ),
      )),
    );
  }

  ListView buildListView(List<ModelGeneral> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ItemsMyFavorite(
            assetName: list[index].imageUrl,
            title: list[index].title,
            name: list[index].name,
            onTap: () {
              //print('Dang click item:${list[index]}');
            },
          ),
        );
      },
    );
  }
}
