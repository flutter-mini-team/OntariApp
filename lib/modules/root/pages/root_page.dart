import 'package:flutter/material.dart';
import 'package:ontari_app/modules/root/widgets/tab_item.dart';
import 'package:ontari_app/providers/bloc_provider.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/modules/activity/pages/activity_page.dart';
import 'package:ontari_app/modules/category/pages/category_page.dart';
import 'package:ontari_app/modules/setting/pages/setting_page.dart';

import '../../../models/user.dart';
import '../../home/pages/home_page.dart';
import '../../../blocs/user_detail_bloc.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key, this.currentTab = TabItem.home}) : super(key: key);
  final TabItem currentTab;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late TabItem _currentTab;
  final _bloc = UserDetailBloc();

  @override
  void initState() {
    super.initState();
    _currentTab = widget.currentTab;
    _bloc.getUserDeTail();
  }

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.activity: GlobalKey<NavigatorState>(),
    TabItem.category: GlobalKey<NavigatorState>(),
    TabItem.setting: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.home: (_) => const HomePage(),
      TabItem.activity: (_) => const ActivityPage(),
      TabItem.category: (_) => const CategoryPage(),
      TabItem.setting: (_) => const SettingPage(),
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      navigatorKeys[tabItem]!.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  Widget _builderNavigator(int index) {
    final item = TabItem.values[index];
    return Builder(
      key: navigatorKeys[index],
      builder: (context) => widgetBuilders[item]!(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // final isFirstRouteInCurrentTab =
        //     !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[widget.currentTab]!.currentState!.maybePop();
        print('isFirstRouteInCurrentTab: $isFirstRouteInCurrentTab');
        print(widget.currentTab);

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: BlocProvider(
          bloc: _bloc,
          child: _builderNavigator(_currentTab.index),
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: DarkTheme.greyScale800,
          unselectedItemColor: DarkTheme.greyScale400,
          selectedItemColor: DarkTheme.primaryBlue600,
          currentIndex: _currentTab.index,
          onTap: (index) => _select(TabItem.values[index]),
          items: [
            _buildItem(TabItem.home),
            _buildItem(TabItem.activity),
            _buildItem(TabItem.category),
            _buildItem(TabItem.setting),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem]!;
    return BottomNavigationBarItem(
      icon: itemData.icon,
      label: itemData.label,
      activeIcon: itemData.activeIcon,
    );
  }
}
