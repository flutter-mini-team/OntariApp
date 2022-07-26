import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/widgets/stless/common_button.dart';

import '../../widgets/stful/indicator_slider.dart';
import '../../widgets/stful/toggle_switch_button.dart';
import '../../widgets/stless/indicator_home.dart';

class CommonWidgetPage extends StatelessWidget {
  const CommonWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Text(
          //   'headline1Bold',
          //   style: TxtStyle.headline1Bold,
          // ),
          // const Text(
          //   'headline2Bold',
          //   style: TxtStyle.headline2Bold,
          // ),
          // const Text(
          //   'headline3SemiBold',
          //   style: TxtStyle.headline3SemiBold,
          // ),
          // const Text(
          //   'headline4SemiBold',
          //   style: TxtStyle.headline4SemiBold,
          // ),
          // const Text(
          //   'headline5Medium',
          //   style: TxtStyle.headline5Medium,
          // ),
          // const Text(
          //   'headline6Medium',
          //   style: TxtStyle.headline6Medium,
          // ),
          // const Text('bodyLargeMedium', style: TxtStyle.bodyLargeMedium),
          // const Text(
          //   'bodyLargeRegular',
          //   style: TxtStyle.bodyLargeRegular,
          // ),
          // const Text(
          //   'bodySmallMedium',
          //   style: TxtStyle.bodySmallMedium,
          // ),
          // const Text(
          //   'bodyMediumRegular',
          //   style: TxtStyle.bodyMediumRegular,
          // ),
          // const Text(
          //   'bodySmallMedium',
          //   style: TxtStyle.bodySmallMedium,
          // ),
          // const Text(
          //   'bodySmallRegular',
          //   style: TxtStyle.bodySmallRegular,
          // ),
          // const Text(
          //   'buttonSmallSemiBold',
          //   style: TxtStyle.buttonLargeSemiBold,
          // ),
          // const Text(
          //   'buttonMediumSemiBold',
          //   style: TxtStyle.buttonMediumSemiBold,
          // ),
          // const Text(
          //   'buttonSmallSemiBold',
          //   style: TxtStyle.buttonSmallSemiBold,
          // ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ClassicButton(
            width: size.width / 1.5,
            radius: 12,
            widthRadius: 0,
            colorRadius: DarkTheme.white,
            height: size.height / 12,
            color: DarkTheme.primaryBlue900,
            child: const Center(child: Text('Sign in')),
          ),
          //const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          // ClassicButton(
          //   width: size.width / 3.5,
          //   radius: 12,
          //   height: size.height / 12,
          //   color: DarkTheme.greyScale900,
          //   child: const Center(child: Text('Get started')),
          // ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ClassicButton(
            width: size.width / 1.5,
            widthRadius: 0,
            radius: 12,
            height: size.height / 12,
            color: DarkTheme.primaryBlue900,
            colorRadius: DarkTheme.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetPath.iconGoogle,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('Sign In with Google'),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width / 10,
                height: size.width / 10,
                child: const CircleButton(
                  bgColor: DarkTheme.primaryBlue900,
                  assetPath: AssetPath.iconPlay,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              SquareButton(
                edge: size.width / 10,
                radius: 10,
                bgColor: DarkTheme.primaryBlue900,
                child: ImageIcon(
                  color: DarkTheme.white,
                  AssetImage(AssetPath.iconClose),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              ClassicButton(
                widthRadius: 0.0,
                width: size.width / 4.5,
                height: size.width / 15,
                radius: 12,
                color: DarkTheme.white,
                colorRadius: DarkTheme.primaryBlue900,
                child: const Center(
                    child: Text(
                  'Change Avatar',
                  style: TxtStyle.buttonSmallSemiBold,
                )),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              IndicatorHome(
                width: size.width / 4,
                height: size.width / 90,
                color: DarkTheme.primaryBlue900,
                radius: 100,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClassicButton(
                width: size.width / 3.5,
                radius: 12,
                widthRadius: 0,
                colorRadius: DarkTheme.white,
                height: size.height / 12,
                color: DarkTheme.primaryBlue900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetPath.iconGoogle,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Google'),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              const ToggleSwitchButton(),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              const IndicatorSlider(edge: 10, count: 3),
            ],
          ),
          
        ],
      ),
    );
  }
}
