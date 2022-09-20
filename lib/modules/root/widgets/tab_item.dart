import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../assets/assets_path.dart';

enum TabItem { home, activity, category, setting }

class TabItemData {
  const TabItemData({
    required this.icon,
    required this.label,
    required this.activeIcon,
  });
  final Widget icon;
  final String label;
  final Widget activeIcon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.home: TabItemData(
      icon: ImageIcon(AssetImage(AssetPath.iconHome)),
      label: 'Home',
      activeIcon: ImageIcon(AssetImage(AssetPath.iconHome)),
    ),
    TabItem.activity: TabItemData(
      icon: ImageIcon(AssetImage(AssetPath.iconActivity)),
      label: 'Activity',
      activeIcon: ImageIcon(AssetImage(AssetPath.iconActivity)),
    ),
    TabItem.category: TabItemData(
      icon: ImageIcon(AssetImage(AssetPath.iconCategory)),
      label: 'Category',
      activeIcon: ImageIcon(AssetImage(AssetPath.iconCategory)),
    ),
    TabItem.setting: TabItemData(
      icon: ImageIcon(AssetImage(AssetPath.iconSetting)),
      label: 'Setting',
      activeIcon: ImageIcon(AssetImage(AssetPath.iconSetting)),
    ),
  };
}
