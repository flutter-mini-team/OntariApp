import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/components/items_download_video.dart';

import '../../config/themes/app_color.dart';
import '../../constants/assets_path.dart';
import '../../widgets/stless/common_avatar.dart';
import '../../widgets/stless/common_textfield.dart';
import 'components/title_setting.dart';

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
                const CustomTextField(
                  height: 48,
                  heightSizedbox: 0,
                  hintText: 'Search your focus...',
                  keyboardType: TextInputType.emailAddress,
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
