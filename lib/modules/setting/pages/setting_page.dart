import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/pages/change_language_page.dart';
import 'package:ontari_app/modules/setting/pages/download_video_page.dart';
import 'package:ontari_app/modules/setting/pages/edit_profile_page.dart';
import 'package:ontari_app/modules/setting/pages/my_favorite_page.dart';
import 'package:ontari_app/modules/setting/widgets/item_account.dart';
import 'package:ontari_app/modules/setting/widgets/items_arrow_setting.dart';
import 'package:ontari_app/modules/setting/widgets/items_toggle_setting.dart';
import 'package:ontari_app/modules/setting/widgets/title_option_setting.dart';
import 'package:provider/provider.dart';

import '../../../services/auth.dart';
import '../../../widgets/stateless/show_alert_dialog.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Text('Setting', style: TxtStyle.titlePage),
                    ),
                    SettingAccount(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => EditProfilePage()),
                        );
                      },
                      fullName: 'Barly Vallendito',
                      userName: 'barlyvallendito',
                      assetName: AssetPath.imgAvatar,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: buildTitleOptionSettings('ACCOUNT SETTING'),
              ),
              buildListView(accountSetting, 0),
              buildTitleOptionSettings('APPLICATION'),
              const SizedBox(height: 16),
              buildListView(application, 0),
              buildListView(applicationToggle, 1),
              TitleOptionSettings(
                height: 16,
                color: DarkTheme.greyScale800,
              ),
              buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  Padding buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: TextButton(
        onPressed: () {
          _confirmSignOut(context);
          // showCupertinoDialog(
          //   context: context,
          //   builder: createDialog,
          // );
          //showDialog(context: context, builder: createDialog);
        },
        child: const Text(
          'Logout',
          style: TxtStyle.textLogout,
        ),
      ),
    );
  }

  TitleOptionSettings buildTitleOptionSettings(String title) {
    return TitleOptionSettings(
      title: title,
      color: DarkTheme.greyScale800,
    );
  }

  // check == 0 : item child ListView is arrow right
  // check == 1 : item child ListView is toggle button
  ListView buildListView(List<ModelSetting> list, int check) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return check == 0
            ? Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: ItemsArrowSetting(
                  onTap: () {
                    goToPage(context, index, list);
                  },
                  assetName: list[index].iconUrl,
                  title: list[index].title,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: ItemsToggleSetting(
                  assetName: list[index].iconUrl,
                  title: list[index].title,
                ),
              );
      },
    );
  }

  goToPage(BuildContext context, int index, List<ModelSetting> list) {
    if (list == application) {
      switch (index) {
        case 0:
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DownloadVideoPage()));
          break;
        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const MyFavoritePage()));
          break;
        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const LanguagePage()));
          break;
      }
    } else {
      switch (index) {
        case 0:
          print('change phone number');
          break;
        case 1:
          print('password');
          break;
      }
    }
  }
}
