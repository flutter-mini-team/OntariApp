import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/modules/activity/pages/activity_page.dart';
import 'package:ontari_app/modules/category/pages/category_page.dart';
import 'package:ontari_app/modules/setting/pages/setting_page.dart';

import '../constants/assets_path.dart';
import 'home/pages/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key, this.bottom = 0}) : super(key: key);
  final int bottom;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late List<Widget> _tabs;
  late int _selectedIndex = widget.bottom;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    _tabs = [HomePage(), ActivityPage(), CategoryPage(), SettingPage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
        print('isFirstRouteInCurrentTab: $isFirstRouteInCurrentTab');
        print(_selectedIndex);

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
          ],
        ),
        // Scaffold(
        //   body: BlocBuilder<AuthCubit, AuthState>(
        //     buildWhen: (previous, current) => current is AuthSingedIn,
        //     builder: (_, state) {
        //       return Stack(
        //         children: [
        //           _buildOffstageNavigator(0),
        //           _buildOffstageNavigator(1),
        //           _buildOffstageNavigator(2),
        //           _buildOffstageNavigator(3),
        //         ],
        //       );
        //     },
        //   ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: DarkTheme.greyScale800,
          unselectedItemColor: DarkTheme.greyScale400,
          selectedItemColor: DarkTheme.primaryBlue600,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetPath.iconHome)),
              label: 'Home',
              activeIcon: ImageIcon(AssetImage(AssetPath.iconHome)),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetPath.iconActivity)),
              label: 'Activity',
              activeIcon: ImageIcon(AssetImage(AssetPath.iconActivity)),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetPath.iconCategory)),
              label: 'Category',
              activeIcon: ImageIcon(AssetImage(AssetPath.iconCategory)),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetPath.iconSetting)),
              label: 'Setting',
              activeIcon: ImageIcon(AssetImage(AssetPath.iconSetting)),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return _tabs.elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
