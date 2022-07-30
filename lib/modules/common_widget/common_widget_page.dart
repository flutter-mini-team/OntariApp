import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/widgets/stless/common_button.dart';

import '../../widgets/stful/indicator_slider.dart';
import '../../widgets/stful/toggle_switch_button.dart';
import '../../widgets/stless/common_avatar.dart';
import '../../widgets/stless/common_textfield.dart';
import '../../widgets/stless/indicator_home.dart';
import '../../widgets/stless/terms.dart';

class CommonWidgetPage extends StatefulWidget {
  const CommonWidgetPage({Key? key}) : super(key: key);

  @override
  State<CommonWidgetPage> createState() => _CommonWidgetPageState();
}

class _CommonWidgetPageState extends State<CommonWidgetPage> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController text = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            const Padding(padding: EdgeInsets.only(top: 50)),
            ClassicButton(
              width: size.width / 1.3,
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
              onTap: () => print('Size: ${size}'),
              width: size.width / 1.3,
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
                  width: size.width / 7,
                  height: size.width / 7,
                  child: const CircleButton(
                    bgColor: DarkTheme.primaryBlue900,
                    assetPath: AssetPath.iconPlay,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                SquareButton(
                  edge: size.width / 7,
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
                  width: size.width / 3.5,
                  height: size.width / 15,
                  radius: 7,
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
                  width: size.width / 2.4,
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
                        padding: EdgeInsets.only(left: 12.0),
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            CustomTextField(
              size: size / 1.2,
              title: 'Email address',
              hintText: 'Enter your email address',
              keyboardType: TextInputType.emailAddress,
              //assetIcon: AssetPath.iconEmail,
              childPrefixIcon: CustomAvatar(
                width: size.width / 24,
                height: size.width / 30,
                assetName: AssetPath.iconEmail,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextFieldPassword(
              size: size / 1.2,
              title: 'Password',
              hintText: 'Enter your password',
              assetPrefixIcon: AssetPath.iconLock,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            // search bar
            CustomTextField(
              //controller: text,
              size: size / 1.2,
              title: 'Search bar',
              hintText: 'Search your focus...',
              keyboardType: TextInputType.emailAddress,
              //assetIcon: AssetPath.iconSearch,
              childPrefixIcon: CustomAvatar(
                width: size.width / 22.5,
                height: size.width / 22.5,
                assetName: AssetPath.iconSearch,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Terms(size: size),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAvatar(
                  height: size.width / 1.3,
                  width: size.width / 2,
                  assetName: AssetPath.img_Avatar,
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                const InputCode(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
