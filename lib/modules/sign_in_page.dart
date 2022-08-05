import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';

import '../constants/assets_path.dart';
import '../widgets/stless/common_avatar.dart';
import '../widgets/stless/common_button.dart';
import '../widgets/stless/common_textfield.dart';
import '../widgets/stless/indicator_home.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: Text('Ontari.', style: TxtStyle.titleSplash),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: CustomTextField(
                title: 'Email address',
                size: size,
                hintText: 'Enter your email address',
                keyboardType: TextInputType.emailAddress,
                childPrefixIcon: const CustomAvatar(
                  width: 15,
                  height: 12,
                  assetName: AssetPath.iconEmail,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextFieldPassword(
                size: size,
                title: 'Password',
                hintText: 'Enter your password',
                assetPrefixIcon: AssetPath.iconLock,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200.0),
              child: TextButton(
                onPressed: () {
                  print('aaaa');
                },
                child: const Text(
                  //textAlign: TextAlign.right,
                  'Forgot password?',
                  style: TxtStyle.headline4blue,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: ClassicButton(
                width: size.width,
                radius: 12,
                widthRadius: 0,
                colorRadius: DarkTheme.primaryBlue600,
                height: 52,
                color: DarkTheme.primaryBlue600,
                child: const Center(child: Text('Sign in')),
              ),
            ),
            const Text(
              'Or continue with social account',
              style: TxtStyle.headline5MediumWhite,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: ClassicButton(
                onTap: () => print('Size: ${size}'),
                width: size.width,
                widthRadius: 0,
                radius: 12,
                height: 52,
                color: DarkTheme.primaryBlueButton900,
                colorRadius: DarkTheme.primaryBlueButton900,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ClassicButton(
                onTap: () => print('Size: ${size}'),
                width: size.width,
                widthRadius: 0,
                radius: 12,
                height: 52,
                color: DarkTheme.primaryBlueButton900,
                colorRadius: DarkTheme.primaryBlueButton900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetPath.iconFacebook,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Sign In with Facebook'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 53.0),
              child: RichText(
                text: const TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TxtStyle.Term,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Create Here',
                      style: TxtStyle.create,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(120, 20, 120, 0),
              child: IndicatorHome(
                color: DarkTheme.white,
                radius: 10,
                height: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}