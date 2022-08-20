import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/widgets/items_download_video.dart';
import 'package:ontari_app/modules/setting/widgets/title_setting.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_textfield.dart';

class DownloadVideoPage extends StatelessWidget {
  const DownloadVideoPage({Key? key}) : super(key: key);

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
                const TitleSetting(title: 'Download Video'),
                const TextFieldSearchBar(
                  hintText: 'Search your focus...',
                  childPrefixIcon: CustomAvatar(
                    width: 16,
                    height: 16,
                    assetName: AssetPath.iconSearch,
                  ),
                ),
                const SizedBox(height: 20),
                buildListView(downloadItem),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildListView(List<ModelSettingDownload> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ItemsDownloadVideo(
            assetName: list[index].imgUrl,
            part: list[index].part,
            title: list[index].title,
            name: list[index].name,
          ),
        );
      },
    );
  }
}
