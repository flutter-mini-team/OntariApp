import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';

import '../../config/routes/routes.dart';
import '../stateless/common_button.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<String> pages = [
      Routes.commonWidgetPage,
      Routes.splash,
      Routes.fullScreenPage,
      Routes.signInPage,
      Routes.signUpPage,
      Routes.verifyYourPage,
      // Routes.forgotPasswordPage,
      Routes.selectPlanPage,
      Routes.homePage,
      Routes.activityPage,
      Routes.categoryPage,
      Routes.detailMentorPage,
      Routes.playingCoursePage,
      Routes.settingPage,
      Routes.languagePage,
      Routes.downloadVideoPage,
      Routes.editProfilePage,
      Routes.favoritePage,
      // Routes.termConditionPage,
    ];
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: pages
                .map((e) => Builder(
                    builder: (context) => Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ClassicButton(
                            height: size.height / 15,
                            width: size.width,
                            widthRadius: 0,
                            colorRadius: DarkTheme.white,
                            color: DarkTheme.greyScale800,
                            child: Center(child: Text(e)),
                            radius: 20,
                            onTap: () {
                              Navigator.pushNamed(context, e);
                            },
                          ),
                        )))
                .toList()),
      ),
    );
  }
}
