import 'package:flutter/material.dart';
import 'package:ontari_app/models/user.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/pages/change_language_page.dart';
import 'package:ontari_app/modules/setting/pages/download_video_page.dart';
import 'package:ontari_app/modules/setting/pages/edit_profile_page.dart';
import 'package:ontari_app/modules/setting/pages/my_favorite_page.dart';
import 'package:ontari_app/modules/setting/widgets/item_account.dart';
import 'package:ontari_app/modules/setting/widgets/items_arrow_setting.dart';
import 'package:ontari_app/modules/setting/widgets/items_toggle_setting.dart';
import 'package:ontari_app/modules/setting/widgets/title_option_setting.dart';

import '../../../blocs/app_state_bloc.dart';
import '../../../providers/bloc_provider.dart';
import '../../../widgets/stateless/show_alert_dialog.dart';
import '../bloc/user_detail_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _bloc = UserDetailBloc();

  void _logOut(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);
    appStateBloc!.logout();
  }

  @override
  void initState() {
    super.initState();
    _bloc.getUserDeTail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: StreamBuilder<User>(
        stream: _bloc.userStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final detail = snapshot.data!;
            //print('---Info---');
            //print(detail.displayFirstName);
            //print(detail.displayLastName);
            //print(detail.email);
            //print(detail.displayName);
            //print(detail.imgUrl);
            //print('---End---');
            return SafeArea(
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
                            fullName:
                                '${detail.displayFirstName} ${detail.displayLastName}',
                            userName: '${detail.displayUserName} ',
                            assetName: '${detail.imgUrl}',
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
                    const TitleOptionSettings(
                      height: 16,
                      color: DarkTheme.greyScale800,
                    ),
                    buildLogoutButton(context),
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return const SliverFillRemaining(
              child: Center(
                child: Text('Something went wrong'),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
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
      _logOut(context);
    }
  }

  Padding buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: TextButton(
        onPressed: () {
          _confirmSignOut(context);
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
                  onTap: () {
                    chooseOption(context, index, list);
                  },
                  assetName: list[index].iconUrl,
                  title: list[index].title,
                ),
              );
      },
    );
  }

  void chooseOption(BuildContext context, int index, List<ModelSetting> list) {
    if (list == applicationToggle) {
      switch (index) {
        case 0:
          print('Notification');
          break;
        case 1:
          print('Dark mode');
          break;
      }
    }
  }

  goToPage(BuildContext context, int index, List<ModelSetting> list) {
    if (list == application) {
      switch (index) {
        case 0:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => DownloadVideoPage()));
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
