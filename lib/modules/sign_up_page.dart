import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/widgets/stless/terms.dart';

import '../config/themes/app_color.dart';
import '../config/themes/text_style.dart';
import '../constants/assets_path.dart';
import '../widgets/stless/common_avatar.dart';
import '../widgets/stless/common_button.dart';
import '../widgets/stless/common_textfield.dart';
import '../widgets/stless/indicator_home.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(top: 55.0),
              child: Text('Sign Up', style: TxtStyle.titleSplash),
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
              padding: const EdgeInsets.fromLTRB(24, 20, 34, 28),
              child: Terms(size: size),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: ClassicButton(
                width: size.width,
                radius: 12,
                widthRadius: 0,
                colorRadius: DarkTheme.primaryBlue600,
                height: 52,
                color: DarkTheme.primaryBlue600,
                child: const Center(child: Text('Sign up')),
              ),
            ),
            const Text(
              'Or continue with social account',
              style: TxtStyle.headline5MediumWhite,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClassicButton(
                  onTap: () => print('Size: ${size}'),
                  width: 151,
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
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('Google'),
                      ),
                    ],
                  ),
                ),
                ClassicButton(
                  onTap: () => print('Size: ${size}'),
                  width: 151,
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
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('Facebook'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: RichText(
                text: const TextSpan(
                  text: 'Already have an account? ',
                  style: TxtStyle.Term,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign in',
                      style: TxtStyle.create,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(120, 80, 120, 5),
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
