import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/modules/activity/activity_page.dart';
import 'package:ontari_app/modules/category/category_page.dart';
import 'package:ontari_app/modules/setting/setting_page.dart';
import 'package:ontari_app/widgets/stless/indicator_home.dart';

import 'constants/assets_path.dart';
import 'modules/home/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key, this.bottom = 0}) : super(key: key);
  final int bottom;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late List<Widget> _tabs;
  //int _currentIndex = 0;
  late int _currentIndex = widget.bottom;

  @override
  void initState() {
    _tabs = [HomePage(), ActivityPage(), CategoryPage(), SettingPage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: DarkTheme.greyScale800,
        unselectedItemColor: DarkTheme.greyScale400,
        selectedItemColor: DarkTheme.primaryBlue600,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetPath.iconHome)),
              label: 'Home',
              activeIcon: ImageIcon(AssetImage(AssetPath.iconHome))),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetPath.iconActivity)),
              label: 'Activity',
              activeIcon: ImageIcon(AssetImage(AssetPath.iconActivity))),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetPath.iconCategory)),
              label: 'Category',
              activeIcon: ImageIcon(AssetImage(AssetPath.iconCategory))),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetPath.iconSetting)),
              label: 'Setting',
              activeIcon: ImageIcon(AssetImage(AssetPath.iconSetting))),
        ],
      ),
    );
  }
}
